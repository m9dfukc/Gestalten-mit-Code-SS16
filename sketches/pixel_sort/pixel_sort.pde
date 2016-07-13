import java.util.Random;

PImage img;
int y;
int p; 

void setup() {
  size(640, 360);
  frameRate(120);
  img = loadImage("moonwalk.jpg");
  y = 0;
  p = 1;
}

void draw() {
  background(255);
  PImage buf = createImage(img.width, img.height, RGB);
  buf = img.copy();
  
  for (int x=0; x < img.width; x += p) { 
    for (int y=0; y < img.height; y++) {
      color[] colors = new color[p];
      for (int i=0; i < p; i++) {
        int index = x+i;
        colors[i] = img.get(index, y);
        if (index >= img.width - 1) {
          break;
        }
      }
      
      shuffleColors(colors);
      
      for (int i=0; i < p; i++) {
        int index = x+i;
        color c = colors[i];
        buf.set(index, y, c);
        if (index >= img.width - 1) {
          break;
        }
      }
    }
  }
  
  img = buf;
  image(img, 0, 0);
  p++;
}

void shuffleColors(color[] array) {
    int index;
    Random random = new Random();
    for (int i = array.length - 1; i > 0; i--)
    {
        index = random.nextInt(i + 1);
        if (index != i)
        {
            array[index] ^= array[i];
            array[i] ^= array[index];
            array[index] ^= array[i];
        }
    }
}