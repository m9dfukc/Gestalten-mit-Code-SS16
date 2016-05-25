// Gestalten mit Code - day 04 - beginner lectures

/**
 * Recursion
 * Fill the screen with rectangles, 
 * every next rect is half the size of the previous.
 * This is an adaption of the while loop example from
 * day 02 but using recursive operations instead
 *
 *
 * Task: 
 * vary rectSize
 */

void setup() {
  size(800, 800);
  frameRate(60);
}

void draw() {
  background(255);
  
  float topLeft = 0;
  float rectSize = 400;
  
  drawRecursiveRect(topLeft, rectSize);
}

void drawRecursiveRect(float topLeft, float rectSize) {
  if (topLeft + rectSize < width && rectSize > 1) {
    float nextTopLeft = topLeft + rectSize;
    float nextRectSize = rectSize / 2;
    
    rect(topLeft, topLeft, rectSize, rectSize);
    drawRecursiveRect(nextTopLeft, nextRectSize);
  }
}