class Point2D {
  float x;
  float y;
  
  Point2D(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void draw() {
    stroke(0);
    ellipse(x, y, 20, 20); 
  }
  
  void move(float _x, float _y) {
    x = x + _x;
    y = y + _y;
  }
  
}

Point2D[] stack = new Point2D[10];

void setup() {
  size(600, 600);
  
  for (int i = 0; i < stack.length; i++) {
    Point2D point = new Point2D(random(width), random(height));
    stack[i] = point;
  }
}

void draw() {
  background(255);
   for (int i = 0; i < stack.length; i++) {
     Point2D point = stack[i];
     point.move(2, 0);
     point.draw(); 
   }
}