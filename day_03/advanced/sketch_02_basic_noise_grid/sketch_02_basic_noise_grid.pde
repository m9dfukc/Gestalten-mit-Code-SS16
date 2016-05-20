// Gestalten mit Code - day 03 - advanced lectures

/**
 * Perlin noise fields
 * Step 2, draw basic grid and add noise
 *
 */

// ArrayList of PVector holding position data
ArrayList<PVector> points = new ArrayList<PVector>();
float time = 0.0;

void setup() {
  size(800, 800);
  strokeWeight(1);
  stroke(255);
  background(0);
  noFill();
  smooth(8);

  // prefill our positions vector
  for (float x=-1; x<=1; x+=0.05) {
    for (float y=-1; y<=1; y+=0.05) {
      PVector v = new PVector(x, y);
      points.add(v);
    }
  }
}

void draw() {
  background(0);
  
  for (PVector point : points) {
    float mX = point.x*0.2; //+time;
    float mY = point.y*0.2; //+time;
    float offset = map(noise(mX, mY), 0, 1, -1, 1);
    
    float x = map(point.x+offset, -1, 1, 0, width);
    float y = map(point.y+offset, -1, 1, 0, height);
    
    point(x, y);
  }
  
  //time += 0.001;
}