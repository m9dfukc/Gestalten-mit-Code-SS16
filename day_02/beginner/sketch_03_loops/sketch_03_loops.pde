// Gestalten mit Code - day 02 - beginner lectures

/**
 * Loops
 * Fill the screen with lines
 *
 * Task: 
 * adjust the number of lines drawn, so that
 * they are still equally placed on the screen
 *
 */


void setup() {
  size(400, 400);
  frameRate(60);
}

void draw() {
  background(255);
 
  for (int i=0; i < 40; i = i + 1) {
    int x = i * 10;
    line(x, 0, x, height);
  }
  
}