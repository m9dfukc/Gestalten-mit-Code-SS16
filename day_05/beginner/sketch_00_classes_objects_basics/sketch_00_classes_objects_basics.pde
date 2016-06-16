class Point2D {
  float x;
  float y;
  
  Point2D(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void move(float x, float y) {
    this.x += x;
    this.y += y;
  }
  
}

Point2D p1;
Point2D p2;

void setup() {
  size(700, 700);
  smooth(8);
  
  p1 = new Point2D(width/2.0, height/2.0);
  p2 = new Point2D(width/2.0 - 40, height/2.0 - 40);

}


void draw() {
  background(255);
  p1.move(2, 0);
  p2.move(0, -1);
  
  fill(255, 0, 0);
  ellipse(p1.x, p1.y, 20, 20);
  
  fill(0, 255, 0);
  ellipse(p2.x, p2.y, 20, 20);
}