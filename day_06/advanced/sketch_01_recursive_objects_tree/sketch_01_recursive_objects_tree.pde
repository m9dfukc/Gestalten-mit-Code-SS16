ArrayList<Branch> tree = new ArrayList<Branch>();
float angle;

void setup() {
  size(700, 700);

  PVector begin = new PVector(0, 0);
  PVector end = new PVector(0, -190);
  Branch root = new Branch(begin, end);
  tree.add(root);

  angle = PI / 4.0;
}

void mousePressed() {
  for (int i = tree.size()-1; i >= 0; i = i - 1) {
    Branch currentBranch = tree.get(i);
    if (!currentBranch.finished) {
      Branch rightBranch = currentBranch.branch(angle);
      Branch leftBranch = currentBranch.branch(-angle);
      Branch centerBranch = currentBranch.branch(random(-1, 1) * angle);
      tree.add(rightBranch);
      tree.add(leftBranch);
      tree.add(centerBranch);
      currentBranch.finished = true;
    }
  }
}

void draw() {
  background(230);

  pushMatrix();
  translate(width/2, height);
  for (Branch branch : tree) {
    branch.show();
    // branch.swing(millis() / 100.0);
  }
  popMatrix();
}

class Branch {
  PVector begin;
  PVector end;
  boolean finished;

  Branch(PVector begin, PVector end) {
    this.begin = begin;
    this.end = end;
  }

  Branch branch(float angle) {
    PVector dir = PVector.sub(this.end, this.begin);
    dir.rotate(angle + random( -0.2, 0.2));
    dir.mult(0.67 + random(-0.3, 0.2));
    PVector newEnd = PVector.add(end, dir);
    Branch newBranch = new Branch(end, newEnd);
    return newBranch;
  }

  void swing(float time) {
    float dist = map(PVector.dist(begin, end), 0, 190, 1, 0);
    end.x += (noise(end.x, time) - 0.5) * dist * 3;
    end.y += (noise(end.y, time) - 0.5) * dist * 3;
  }

  void show() {
    stroke(0);
    float dist = map(PVector.dist(begin, end), 0, 190, 0, 5);
    strokeWeight(dist);
    line(begin.x, begin.y, end.x, end.y);
  }

}
