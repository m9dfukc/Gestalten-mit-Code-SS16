// Gestalten mit Code - day 04 - advanced lectures

/* In the late 1980s, computer scientist Craig Reynolds developed
 * algorithmic steering behaviors for animated characters.
 * The most famous example is Reynolds’s "boids model" for
 * swarm like behavior.
 */

Boid boid;

void setup() {
  size(600, 600);
  boid = new Boid(width/2, height/2);
}

void draw() {
  background(255);
  
  PVector mPos = new PVector(mouseX, mouseY);

  noFill();
  stroke(0);
  ellipse(mPos.x, mPos.y, 20, 20);

  boid.seek(mPos);
  boid.draw();
}