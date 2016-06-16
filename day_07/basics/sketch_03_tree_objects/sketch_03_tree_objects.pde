ArrayList<Branch> tree = new ArrayList<Branch>();
float angle;

void setup() {
  size(700, 700);

  PVector begin = new PVector(width/2, height);
  PVector end = new PVector(width/2, height-200);
  Branch root = new Branch(begin, end);
  tree.add(root);
  
  angle = 45;
}

void draw() {
  background(255);

  for (int i = 0; i < tree.size(); i++) {
    Branch b = tree.get(i);
    b.swing();
    b.draw();
  }
}

void generate() {
  for (int i = tree.size()-1; i >= 0; i--) {
    Branch hello = tree.get(i);
    if (hello.finished == false) {
      Branch right = hello.branch(radians(angle));
      Branch left = hello.branch(radians(-angle));
      hello.finished = true;
      tree.add(right);
      tree.add(left);
    }
  }
}

void mousePressed() {
  generate();
}