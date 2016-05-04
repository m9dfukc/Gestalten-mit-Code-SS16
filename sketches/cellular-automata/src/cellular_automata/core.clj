(ns cellular-automata.core
  (:require [quil.core :as q]
            [quil.middleware :as m]))

(defn init-generation [n]
  (assoc
   (vec (repeat rows 0))
   (int (* rows 0.5)) 1))

(defn to-radix
  [int r]
  (.toString (biginteger int) r))

(defn setup []
  (q/frame-rate 30)
  {:cols 41
   :rows 41
   :rule :rule-30
   :cells (init-generation 41)})


(defn update-state [state]
  state)

(defn draw-state [state]
  (q/background 255))

(q/defsketch cellular-automata
  :title "1D Cellular Automata"
  :size [500 500]
  ; setup function called only once, during sketch initialization.
  :setup setup
  ; update-state is called on each iteration before draw-state.
  :update update-state
  :draw draw-state
  :features [:keep-on-top]
  ; This sketch uses functional-mode middleware.
  ; Check quil wiki for more info about middlewares and particularly
  ; fun-mode.
  :middleware [m/fun-mode])
