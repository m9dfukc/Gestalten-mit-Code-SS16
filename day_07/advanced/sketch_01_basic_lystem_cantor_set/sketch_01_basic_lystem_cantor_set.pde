/* Definition of an L-systems:
 * a. [Alphabet] An L-system’s alphabet is comprised of the valid characters that can be included.
 * b. [Axiom] The axiom is a sentence that describes the initial state of the system.
 * c. [Rules] The rules of an L-system are applied to the axiom and then applied recursively, 
 *            generating new sentences over and over again. An L-system rule includes two 
 *            sentences, a "predecessor" and a "successor".
 *
 * Let's rebuild the cantor set in an L-System:
 * Alphabet: A B
 * Axiom: A
 * Rules: (A -> ABA) (B -> BBB)
 */

// starting conditions (the axiom) using one character of our Alphabet
String current = "A";
int gen = 0;

void setup() {
  println("Generation " + gen + ": " + current);
}

void draw() {
}

void mousePressed() {
  StringBuffer next = new StringBuffer();
  for (int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    // our rules predecessor -> successor
    if (c == 'A') {
      next.append("ABA");
    }  else if (c == 'B') {
      next.append("BBB");
    }
  }
  current = next.toString();
  gen++;
  println("Generation " + gen + ": " + current);
}