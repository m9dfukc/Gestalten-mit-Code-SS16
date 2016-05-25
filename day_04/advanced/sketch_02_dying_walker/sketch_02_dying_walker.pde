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
  
  for (int i = walkers.size()-1; i >= 0; i--) {
    Walker w = walkers.get(i);   
    if (w.isDead()) {
      walkers.remove(i);
    }
  }
}