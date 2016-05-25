void setup() {
  size(600, 600);
  smooth(4);
}

void draw() {
  background(240);
  
  for(int x = 40; x <= 560; x += 10) {
    
    for (int y = 40; y <= 560; y += 10) {
      if (x%20 == 0) {
        line(x, y, x+5, y+5);
      } else {
        line(x, y, x+5, y-5);
      }
      
    }
    
  }
}