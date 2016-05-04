/* The basics anatomy of our Processing App 
 * -- initialization and the draw "loop"
 * -- what are functions and why we use them
 * -- "scope" of variables 
 */

// initialize our variables
int frameCounter = 0;
float stepsPerRotation = 120;

// entrance to our application
void setup() {
  size(400, 400);
  frameRate(30);
  smooth(4);
  colorMode(RGB);
  noStroke();
}

// this function get's called 30 times per second
void draw() {
  background(255);
  
  float accum = frameCounter / stepsPerRotation;
  float angle = accum * TWO_PI;
  
  float x = sin(angle);
  float y = cos(angle);
  
  float positionX = map(x, -1, 1, 30, width-30);
  float positionY = map(y, -1, 1, 30, height-30);
  
  fill(255, 0, 0);
  ellipse(positionX, positionY, 20, 20);
  
  frameCounter = frameCounter + 1;
}