// Gestalten mit Code - day 03 - advanced lectures

/**
 * Perlin noise fields
 * Step 5, let's put our curve funtions to a separate file
 *
 * Task:
 * try the othe functions (circle, astroid, cissoid ...)
 * try different noise scales
 *
 */


// ArrayList of PVector holding position data
ArrayList<PVector> points = new ArrayList<PVector>();
float time = 0.0;
float vScale = 0.001;

// colors used for points
color[] palette = {
  color(0, 91, 197),
  color(0, 180, 252),
  color(23, 249, 255),
  color(223, 147, 0),
  color(248, 190, 0)
};


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
      // add some randomness 
      float _x = x + randomGaussian() * 0.005;
      float _y = y + randomGaussian() * 0.005;
      PVector v = new PVector(_x, _y);
      points.add(v);
    }
  }
}

void draw() {
  //background(0);
  
  noiseSeed(0);
  
  int index = 0;
  for (PVector point : points) {
    float x = map(point.x, -1, 1, 0, width);
    float y = map(point.y, -1, 1, 0, height);
    
    // color lookup
    int pIndex = (int)(palette.length*noise(index/100.0)); // vary noise function
    stroke(palette[pIndex], 30); // maybe add alpha
    
    // draw points
    point(x, y);
    
    // flow field calculations
    //float n = TWO_PI * noise(point.x, point.y);
    float n = 10 * map(noise(point.x, point.y), 0, 1, -1, 1); // use factor of 10/100/1000/...
    PVector v = circle(n); // use one of our cure functions
    
    point.x += vScale * v.x;
    point.y += vScale * v.y;
    
    index++;
  }
  
  //time += 0.001;
}