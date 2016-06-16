/* LSystem using the following "Alphabet": 
 * F: Draw a line and move forward
 * G: Move forward (without drawing a line)
 * +: Turn right
 * -: Turn left
 * [: Save current location
 * ]: Restore previous location
 */

LSystem l;
Turtle t;

void setup() {
  size(800, 800);
  
  Rule[] rules = new Rule[1];
  rules[0] = new Rule('F', "FF-[-F+F+F]+[+F+F+F]");
  
  l = new LSystem("F", rules);
  t = new Turtle(l.getSentence(), height/4.0, radians(20));
}

void draw() {
  background(255);  
  fill(0);
  
  translate(width/2, height);
  rotate(-PI/2);
  t.draw();
  noLoop();
}

void mousePressed() { 
  pushMatrix();
    l.generate();
    t.setSentence(l.getSentence());
    t.multiplyLen(0.5);
    popMatrix();
    redraw(); 
  redraw();
}