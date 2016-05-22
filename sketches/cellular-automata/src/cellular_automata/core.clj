(ns cellular-automata.core
  (:require [quil.core :as q]
            [quil.middleware :as m]))

(defn init-generation [n]
  (assoc
   (vec (repeat n 0))
   (int (* n 0.5)) 1))

(defn to-radix
  [int r]
  (.toString (biginteger int) r))

(defn int->binaryseq
  "integer number to binary sequence"
  [i]
  (map (fn [n] (read-string (str n)))
       (to-radix i 2)))

(defn zero-pad
  "pad a sequence with 0's"
  [n len]
  (let [seq-len (count n)
        diff (- len seq-len)
        pad (repeat diff 0)]
    (concat pad n)))

(defn rule->binaryseq
  "ca rule to binary sequence mapping"
  [rule]
  (zero-pad (int->binaryseq rule) 8))

(def input-patterns
  (map (fn [n]
         (zero-pad (int->binaryseq n) 3))
       (reverse (range 0 8))))

(defn rule-mappings
  "map ca rule to a corresponding input pattern"
  [rule]
  (let [rule-seq (rule->binaryseq rule)]
    (zipmap input-patterns rule-seq)))

(defn zip-neighbors [n]
  (let [l (concat [(last n)] (butlast n))
        r (concat (rest n) [(first n)])]
    (map list l n r)))

(defn generation
  "apply our ca rule to a row of cells and produce a new generation"
  [cells rule]
  (let [mappings (rule-mappings rule)
        upper-bound (count cells)
        neighbors (zip-neighbors cells)]
    (map-indexed (fn [k v] (get mappings (nth neighbors k)))
                 cells)))

(defn setup []
  (q/frame-rate 60)
  (q/background 255)
  {:rule 30
   :row 0
   :cells (init-generation (q/width))})

(defn update-state [state]
  (let [rule (:rule state)
        last-row (:row state)
        last-cells (:cells state)]
    {:rule (if (>= last-row (q/height))
            (int (q/random 255))
            rule)
     :row  (if (< last-row (q/height))
            (+ last-row 1)
            0)
     :cells (if (< last-row (q/height))
             (generation last-cells rule)
             (init-generation (q/width)))}))

(defn draw-state [state]
  (let [rule (:rule state)
        cells (:cells state)
        indexed (map-indexed vector cells)
        y-pos (:row state)]
    ;; clear screen if we reached the bottom
    (when (= y-pos 0) (q/background 255))
    ;; draw our cells
    (doseq [[x-pos cell] indexed]
      (if (= cell 1) (q/stroke 0) (q/stroke 255))
      (q/point x-pos y-pos))
    ;; draw which rule is choosen
    (q/no-stroke)
    (q/fill 255)
    (q/rect 5 2 32 17)
    (q/fill 0)
    (q/text (str rule) 10 15)))

(defn mouse-pressed
  "on mouse pressed choose new random ca rule"
  [state event]
  (assoc-in state [:rule] (int (q/random 255))))

(q/defsketch cellular-automata
  :title "1D Cellular Automata"
  :size [500 500]
  :setup setup
  :update update-state
  :draw draw-state
  :mouse-pressed mouse-pressed
  :features [:keep-on-top]
  :middleware [m/fun-mode])
