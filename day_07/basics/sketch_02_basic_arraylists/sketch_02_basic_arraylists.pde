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

//Point2D[] stack = new Point2D[10];
ArrayList<Point2D> stack = new ArrayList<Point2D>();
int num = 100;

void setup() {
  size(600, 600);
  
  for (int i = 0; i < num; i++) {
    Point2D point = new Point2D(random(width), random(height));
    stack.add(point);
  }
}

void draw() {
  background(255);
   for (int i = 0; i < stack.size(); i++) {
     Point2D point = stack.get(i);
     //point.move(2, 0);
     point.draw(); 
   }
}

void mousePressed() {
  Point2D point = new Point2D(random(width), random(height));
  stack.add(point);
}