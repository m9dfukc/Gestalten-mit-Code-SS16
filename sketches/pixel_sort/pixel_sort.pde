import java.util.Random;

PImage img;
int y;
int randomFactor;

void setup() {
  size(640, 360);
  frameRate(120);

  img = loadImage("moonwalk.jpg");
  randomFactor = 10; // vary this to get different results
  y = 0;
}

void draw() {
  background(255);
  PImage buf = createImage(img.width, img.height, RGB);
  // randomize sampling window
  int p = int(max(random(1, randomFactor), 1)); 

  for (int x=0; x < img.width; x += p) { 
    for (int y=0; y < img.height; y++) {
      color[] colors = new color[p];
      for (int i=0; i < p; i++) {
        int index = x+i;
        // wrap over if we reached the boundaries
        if (index >= img.width-1) {
          colors[i] = img.get(i, y);
        } else {
          colors[i] = img.get(index, y);
        }
      }

      shuffleColors(colors);

      for (int i=0; i < p; i++) {
        int index = x+i;
        color c = colors[i];
        if (index >= img.width-1) {
          buf.set(i, y, c);
        } else {
          buf.set(index, y, c);
        }
      }
    }
  }

  img = buf;
  image(img, 0, 0);
}

void shuffleColors(color[] array) {
  int index;
  Random random = new Random();
  for (int i = array.length - 1; i > 0; i--) {
    index = random.nextInt(i + 1);
    if (index != i) {
      array[index] ^= array[i];
      array[i] ^= array[index];
      array[index] ^= array[i];
    }
  }
}