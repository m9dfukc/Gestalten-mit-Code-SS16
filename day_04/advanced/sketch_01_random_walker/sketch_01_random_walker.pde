ArrayList<Walker> walkers = new ArrayList<Walker>();
int num = 300;

void setup() {
  size(600, 600);
  for (int i=0; i < num; i++) {
    Walker w = new Walker(random(width), random(height));
    walkers.add(w);
  }
}

void draw() { 
  for (Walker w : walkers) {
    w.draw();
  }
}