/* Coordinate system and input from the outside world
 * -- and how matrix translation works
 */
 
void setup() {
  size(400, 400);
  frameRate(30);
}

void draw() {
  background(255);
  ellipse(mouseX, mouseY, 30, 30);
  // vs
  /*
  pushMatrix();
  translate(mouseX, mouseY);
  ellipse(0, 0, 30, 30);
  popMatrix();
  */
  
}