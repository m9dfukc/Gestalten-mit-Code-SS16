LSystem l;

void setup() {
  size(800, 800);
  
  Rule[] rules = new Rule[2];
  rules[0] = new Rule('A', "ABA");
  rules[1] = new Rule('B', "BBB");
  
  l = new LSystem("A", rules);
  
  println("Generation " + l.getGeneration() + ": " + l.getSentence());
}

void draw() {  
}

void mousePressed() { 
  l.generate();
  println("Generation " + l.getGeneration() + ": " + l.getSentence());
}