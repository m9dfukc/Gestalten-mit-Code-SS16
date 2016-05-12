// Gestalten mit Code - day 02 - andvanced lectures

/**
 * draws the output of the noise function as a chart.
 * Note: noise values stay the same when restarting  
 * the sketch because we are using the same 'noiseSeed'.
 * 
 * MOUSE
 * click               : new random line
 * mouseX              : scale the values we feed the noise function
 *
 * KEY
 * up                  : increase octave by 1
 * down                : decrease octave by 1
 * right               : decrease falloff by 0.05
 * left                : increase falloff by 0.05
 *
 */

int randomElements = 100;
int randomSeed = 0;
int stepWidth;
int octave = 4;
float falloff = 0.45;

Point[] points = new Point[randomElements];

void setup() {
  size(1000, 240);
  noFill();

  stepWidth = width / randomElements;
  calcRandomValues();
}

void draw() {
  background(255);
  
  // draw the graph
  beginShape();
  noFill(); 
  stroke(#C0BCB6);
  for (Point p: points) {
    vertex(p.x, p.y);
  } 
  endShape();
  
  // dots
  noStroke();
  for (Point p: points) {
    int size = 5;
    fill(#1FBED6);
    ellipse(p.x, p.y, size, size);
  }
  
  // draw our mouseX position
  stroke(#FF717E);
  line(mouseX, 0, mouseX, height);
  fill(#555555);
  String text1 = "Octave: " + octave + "  (Key up/down)";
  String text2 = "Falloff: " + nf(falloff, 0, 2) + "  (Key left/right)";
  text(text1, mouseX+5, height - 30);
  text(text2, mouseX+5, height - 15);
}

// calculate the random values and fill our points array
void calcRandomValues() {
  noiseSeed(randomSeed);
  noiseDetail(octave, falloff);
  for (int i=0; i < randomElements; i++) {
    float posX = (i * stepWidth) + (stepWidth / 2.0);
    float randY = noise(posX / mouseX);
    float posY = map(randY, 0, 1, 0, height);
    points[i] = new Point(posX, posY); // see Point class constructor for conversion to int
  }
}

void mouseMoved() {
  calcRandomValues();
}

void mouseReleased() {
  randomSeed++;
  calcRandomValues();
}

void keyPressed() {
  if (keyCode == UP) octave++;
  if (keyCode == DOWN && octave > 0) octave--;
  if (keyCode == LEFT && falloff > 0.1) falloff -= 0.05;
  if (keyCode == RIGHT && falloff < 0.95) falloff += 0.05;
  calcRandomValues();
  println(octave);
}