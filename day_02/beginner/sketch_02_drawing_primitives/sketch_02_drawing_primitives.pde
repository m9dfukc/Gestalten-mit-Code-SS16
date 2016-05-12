// Gestalten mit Code - day 02 - beginner lectures

/**
 * Showcase some of the 2d drawing primitives
 *
 */

void setup() {
  size(400, 400);
  frameRate(60);
  
}

void draw() {
  background(255);
  
  // black horizontal stroke
  stroke(0);
  line(0, height/2, width, height/2);
  
  // gray horizontal stroke
  stroke(200);
  line(0, height/2 + 10, width, height/2 + 10);
  
  // draw a rectangle without an outline
  noStroke();
  fill(200);
  rect(40, 180, 100, 100);
  
  // draw a red ellipse with no fill but a red outline
  noFill();
  stroke(255, 0, 0);
  ellipse(width/2, height/2, 50, 50);
}