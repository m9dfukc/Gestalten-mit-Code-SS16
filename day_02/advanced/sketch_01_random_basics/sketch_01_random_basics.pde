// Gestalten mit Code - day 02 - andvanced lectures

/**
 * draws the output of the random function as a chart
 * and shows the occurrence of a picked (int) random value.
 * Note: random values stay the same when restarting  
 * the sketch because we are using the same 'randomSeed'.
 * 
 * MOUSE
 * click               : new random line
 * mouseX              : pick a random value and show it's occurrence
 *
 */

int randomElements = 100;
int randomSeed = 0;
int stepWidth;
int pickedValue;

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
  for (Point p : points) {
    vertex(p.x, p.y);
  } 
  endShape();

  // draw the picked random value and it's occurrences
  noStroke();
  for (Point p : points) {
    int size = 5;
    if (dist(mouseX, 0, p.x, 0) <= stepWidth / 2.0) {
      pickedValue = p.y;
      size = 10;
      fill(#FF717E);
    } else if (pickedValue == p.y) {
      size = 10;
      fill(#97C30A);
    } else {
      fill(#1FBED6);
    }

    ellipse(p.x, p.y, size, size);
  }

  // draw our mouseX position
  stroke(#FF717E);
  line(mouseX, 0, mouseX, height);
  fill(#555555);
  text(pickedValue, mouseX + 5, height - 20);
}

// calculate the random values and fill our points array
void calcRandomValues() {
  for (int i=0; i < randomElements; i++) {
    float posX = (i * stepWidth) + (stepWidth / 2.0);
    float randY = random(0, height);
    points[i] = new Point(posX, randY); // see Point class constructor for conversion to int
  }
}

void mouseReleased() {
  randomSeed++;
  calcRandomValues();
}