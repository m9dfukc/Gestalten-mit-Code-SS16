// Gestalten mit Code - day 03 - beginner lectures

/**
 * Loops
 * Recap: Fill the screen with lines modulated by a sine wave
 *
 */

float lineDistance = 5.0;
float numLines;

void setup() {
  size(800, 300);
  frameRate(60);
  
  noFill();
  
  numLines = width / lineDistance;

}

void draw() {
  
  background(255);
  
  beginShape();
  for (int i=0; i < numLines; i = i + 1) {
    
    float zeroToPI = map(i, 0, numLines, 0, PI * 12);
    float sinFunc = sin(zeroToPI);
    float t = i * lineDistance - (lineDistance * sinFunc);
    
    line(t, 0, t, height);
    vertex(t, map(sinFunc, -1, 1, 0, height));
  }
  endShape();
  
}