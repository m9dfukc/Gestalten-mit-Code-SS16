// Gestalten mit Code - day 02 - beginner lectures

/**
 * While Loop
 * Fill the screen with rectangles, 
 * every next rect is half the size of the previous
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
  
  boolean reachedEnd = false;
  float topLeft = 0;
  float rectSize = 400;
  
  while(!reachedEnd) {
    rect(topLeft, topLeft, rectSize, rectSize);
    
    topLeft += rectSize;
    rectSize = rectSize / 2.0;
    if (topLeft + rectSize > width || rectSize < 1) {
      reachedEnd = true;
    }
  }
  
}