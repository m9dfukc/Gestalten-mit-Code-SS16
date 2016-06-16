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
int padding = 30;

void setup() {
  size(700, 400);
  strokeCap(SQUARE);
  strokeWeight(10);
  stroke(0);
  noSmooth();
  background(255);

  frameRate(1);
  println("Generation " + gen + ": " + current);
}

// A: Draw a line forward.
// B: Move forward without drawing.
void draw() {
  // reset after x generations
  if (gen > 6) {
    gen = 0;
    current = "A";
    background(255);
  }
  
  float len = width / float(current.length());
  float offY = (gen + 1) * padding;

  pushMatrix();
  translate(0, offY);
  for (int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    if (c == 'A') {
      line(0, 0, len, 0);
      translate(len, 0);
    } else if (c == 'B') {
      translate(len, 0);
    }
  }    
  popMatrix();
  generate();
}

void generate() {
  StringBuffer next = new StringBuffer();
  for (int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    // our rules (predecessor -> successor)
    if (c == 'A') {
      next.append("ABA");
    } else if (c == 'B') {
      next.append("BBB");
    }
  }
  current = next.toString();
  gen++;
  println("Generation " + gen + ": " + current);
}