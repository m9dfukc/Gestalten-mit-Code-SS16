class Point {
  int x;
  int y;
  
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  Point(float x, float y) {
    this((int)x, (int) y);
  }
}