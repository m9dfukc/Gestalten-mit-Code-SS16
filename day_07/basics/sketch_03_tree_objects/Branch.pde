class Branch {
  PVector begin;
  PVector end;
  boolean finished;
  
  Branch(PVector a, PVector b) {
    begin = a; //new PVector(a.x, a.y);
    end = b; //new PVector(b.x, b.y);
    finished = false;
  }
  
  Branch branch(float angle) {
    PVector dir = PVector.sub(end, begin); 
    dir.rotate(angle);
    dir.mult(0.65);
    PVector newEnd = PVector.add(end, dir);
    Branch newBranch = new Branch(end, newEnd);
    return newBranch;
  }
  
  void swing() {
    end.x += random(-5, 5);
    end.y += random(-2, 2);
  }
  
  void draw() {
    stroke(0);
    line(begin.x, begin.y, end.x, end.y);
  }
  
  
}