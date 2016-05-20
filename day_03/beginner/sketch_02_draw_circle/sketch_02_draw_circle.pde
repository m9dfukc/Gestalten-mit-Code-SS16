// Gestalten mit Code - day 03 - beginner lectures

/**
 * Trigonometry
 * How to draw a circle using sine and cosine
 * Using shapes (beginShape, endShape and vertex)
 *
 */


int numPoints = 100;

void setup() {
  size(600, 600);
  noFill();
}


void draw() {
  background(255);
  
  beginShape();
  for (int i=1; i <= numPoints; i++) {
     float t = map(i, 1, numPoints, 0, TWO_PI);
     float p = map(i, 1, numPoints, 0, TWO_PI);
     
     float sinFunc = sin(t);
     float cosFunc = cos(p);
     
     float posX = map(sinFunc, -1, 1, 10, width-10);
     float posY = map(cosFunc, -1, 1, 10, height-10);
     
     vertex(posX, posY);
  }
  endShape();
  
}