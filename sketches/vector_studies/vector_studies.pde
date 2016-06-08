PVector[] wings = new PVector[900];

void setup() {
  size(700, 700);
  int index = 0;
  
  for (int y = 0; y < 30; y++) {
    for (int x = 0; x < 30; x++) {
      float posX = map(x, 0, 29, 100, width - 100);
      float posY = map(y, 0, 29, 100, height - 100);
      
      wings[index] = new PVector(posX, posY);
      index = index + 1;
    }
  }
}

void draw() {
  background(255);
  PVector look = new PVector(mouseX, mouseY);
  for (int i=0; i < wings.length; i++) {
    PVector start = wings[i];
    PVector end   = new PVector(start.x, start.y + 20);
    
    PVector t = PVector.sub(look, start);
    float rotation = t.heading2D();
    
    PVector v = PVector.sub(end, start);
    v.rotate(rotation + PI / 2.0);
    PVector newEnd = PVector.sub(start, v);
    
    line(start.x, start.y, newEnd.x, newEnd.y);
  }
}