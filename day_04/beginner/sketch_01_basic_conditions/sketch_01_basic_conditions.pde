// Gestalten mit Code - day 04 - beginner lectures

/**
 * Conditions (if / else)
 *
 */

void setup() {
  size(600, 600);
  smooth(4);
}

void draw() {
  background(240);
  
  for(int x=40; x <= 560; x += 10) {
    
    if (x >= width / 2.0) {
      line(x, height/2.0, x, height-40);
    } else {
      line(x, 40, x, height/2.0); 
    }
    
  }
}