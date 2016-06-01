float factor = 0;
float angle = 0;

void setup() {
  size(700, 700);
  background(230);
}

void draw() {
  background(230);
  translate(width/2, height);
  angle = map(mouseX, 0, width, 0, PI);
  factor = map(mouseY, 0, height, 0.45, 0.8);
  branch(200, angle);
}

void branch(float length, float angle) {
  line(0, 0, 0, -length);
  translate(0, -length);
  if (length > 4) {

    pushMatrix();
    rotate(angle);
    branch(length*factor, angle);
    popMatrix();

    pushMatrix();
    rotate(-angle);
    branch(length*factor, angle);
    popMatrix();
  }
}
