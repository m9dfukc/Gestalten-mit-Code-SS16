// Gestalten mit Code - day 04 - beginner lectures

/**
 * Recursion
 * Shows how to recursively scale (and offset) a circle 
 *
 * Task: 
 * try the other combinations (in comments below)
 */

void setup() {
  size(700,400);
}
 
void draw() {
  background(255);
  drawCircle(width/2, height/2, 200);
}
 
void drawCircle(float x, float y, float radius) {
  stroke(0);
  noFill();
  ellipse(x, y, radius, radius);
  
  // this is our "exit" condition
  if(radius > 10) { // vary min size
    // ----
    radius *= 0.75;
    drawCircle(x, y, radius);
    
    // ----
    //drawCircle(x + radius/2, y, radius/2);
    //drawCircle(x - radius/2, y, radius/2);
    
    // ----
    //drawCircle(x + radius/2, y, radius/2);
    //drawCircle(x - radius/2, y, radius/2);
    //drawCircle(x, y + radius/2, radius/2);
    //drawCircle(x, y - radius/2, radius/2);
  }
}