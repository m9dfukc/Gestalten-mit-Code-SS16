// Gestalten mit Code - day 02 - beginner lectures

/**
 * Loops
 * Fill the screen with lines modulated by a sine wave
 *
 * Task: 
 * try to adjust the PI values and the 'amplitude' 
 * of displacement
 *
 */

int numLines = 100;
float lineDistance;

void setup() {
  size(800, 300);
  frameRate(60);
  
  lineDistance = width / (float) numLines;
}

void draw() {
  background(255);
 
  for (int i=0; i < numLines; i = i + 1) {
    float t = map(i, 0, 99, 0, PI*6);
    float f = sin(t);
    float x = i * lineDistance + f * 30;
    line(x, 0, x, height);
  }
  
}