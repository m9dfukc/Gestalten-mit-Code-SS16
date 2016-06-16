ArrayList<KochLine> lines = new ArrayList<KochLine>();

void setup() {
  size(700, 700);
  smooth(8);

  PVector a = new PVector(100, 200);
  PVector b = new PVector(width-100, 200);
  PVector c = new PVector(width/2.0, height-100);

  lines.add(new KochLine(a, b));
  lines.add(new KochLine(b, c));
  lines.add(new KochLine(c, a));

  for (int i = 0; i < 4; i++) {
    generate();
  }

}

void draw() {
  background(255);
  for (KochLine line : lines) {
    line.show();
  }
}

void generate() {
  ArrayList<KochLine> newGen = new ArrayList<KochLine>();
  for (KochLine line : lines) {
    PVector a = line.getA();
    PVector b = line.getB();
    PVector c = line.getC();
    PVector d = line.getD();
    PVector e = line.getE();

    newGen.add(new KochLine(a, b));
    newGen.add(new KochLine(b, c));
    newGen.add(new KochLine(c, d));
    newGen.add(new KochLine(d, e));
  }

  lines = newGen;
}

class KochLine {
  PVector start;
  PVector end;

  KochLine(PVector a, PVector b) {
    start = a.get();
    end   = b.get();
  }

  void show() {
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }

  PVector getA() {
    return start.get();
  }

  PVector getB() {
    PVector v = PVector.sub(end, start);
    v.div(3.0);
    v.add(start);
    return v;
  }

  PVector getC() {
    PVector a = start.get();
    PVector v = PVector.sub(end, start);
    v.div(3.0);
    a.add(v);

    v.rotate(radians(-60));
    a.add(v);

    return a;
  }

  PVector getD() {
    PVector v = PVector.sub(end, start);
    v.mult(2.0/3.0);
    v.add(start);
    return v;
  }

  PVector getE() {
    return end.get();
  }
}
