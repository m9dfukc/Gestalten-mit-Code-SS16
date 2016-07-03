boolean pause = false;
int cellSize = 1;
int gridCountX;
int gridCountY;

int[][] grid;
int[][] buffer;

PImage img;
PImage img2;

float randProbability = 0.98;


void setup() {
  size(600, 600);
  frameRate(9);
  noSmooth();
  background(255);
  
  gridCountX = int(width/cellSize);
  gridCountY = int(height/cellSize);

  grid       = new int[gridCountY][gridCountX];
  buffer = new int[gridCountY][gridCountX];
  img        = createImage(gridCountX, gridCountY, RGB);
  img2       = loadImage("initial.png");

  grid       = populateFromImage(img2);
}

int[][] populateFromImage(PImage img) {
  int rows = img.height;
  int cols = img.width;
  int[][] g = new int[cols][rows];
  img.loadPixels();
  for (int i=0; i < rows; i++) {
    for (int j=0; j < cols; j++) {
      float red = red(img.get(j, i));
      g[i][j] = (red > 128) ? 0 : 1;
    }
  }
  return g;
}

int[][] populate(int[][] g) {
  int rows = g.length;
  int cols = (rows > 0) ? g[0].length : 0;
  for (int i=0; i < rows; i++) {
    for (int j=0; j < cols; j++) {
      g[i][j] = (random(1) > randProbability) ? 1 : 0; //  (i%2 == 0) ? 1 : 0; //
    }
  }
  return g;
}

int[][] empty(int[][] g) {
  int rows = g.length;
  int cols = (rows > 0) ? g[0].length : 0;
  for (int i=0; i < rows; i++) {
    for (int j=0; j < cols; j++) {
      g[i][j] = 0;
    }
  }
  return g;
}

void process() {
  if (frameCount%3==0) {
    buffer = new int[gridCountY][gridCountX]; // reset buffer erery third frame
  }
  for (int i=1; i < gridCountY-1; i++) {
    for (int j=1; j < gridCountX-1; j++) {

      int idxLeft     = j - 1; 
      int idxRight    = j + 1;
      int idxTop      = i - 1;
      int idxBottom   = i + 1;

      int current     = grid[i][j];
      int left        = grid[i][idxLeft];
      int right       = grid[i][idxRight];
      int top         = grid[idxTop][j];
      int bottom      = grid[idxBottom][j];
      int topLeft     = grid[idxTop][idxLeft];
      int topRight    = grid[idxTop][idxRight];
      int bottomLeft  = grid[idxBottom][idxLeft];
      int bottomRight = grid[idxBottom][idxRight];

      int sum = left + right + top + bottom + topLeft + topRight + bottomLeft + bottomRight; // + current;

      // Rules
      buffer[i][j] = current; 
      if ((current == 1) && (sum >  3)) buffer[i][j] = 0;
      if ((current == 0) && (sum == 3)) buffer[i][j] = 1;     
      if ((topLeft == 1) && (sum >  7)) buffer[i][j] = 1;      
                                        
    }
  } 
  grid = buffer;
}

void draw() {
  background(255);
  img.loadPixels();
  
  for (int i=1; i < gridCountY; i++) {
    for (int j=1; j < gridCountX; j++) {
     
      int cell = grid[i][j];
      color c = color(255);
      if (cell == 1) {
        if (grid[i-1][j-1] == 1)
          c = color(0);
        else
          c = color(0,0,255);
      }
      
      img.set(j, i, c);
      
    }
  }
  img.updatePixels();
  image(img, 0, 0, width, height);

  if (!pause) {
    process();
  }
}

void keyPressed() {
  if(key == ' ') {
    pause = !pause;
  }
  if(key == 'r') {
    grid = populate(grid);
  }
  if(key == 'c') {
    grid = empty(grid);
  }
}

void mouseDragged() {
  int indexX = int(mouseX / cellSize);
  int indexY = int(mouseY / cellSize);
  int cell = grid[indexY][indexX];
  
  cell = (cell == 0) ? 1 : 0;
  grid[indexY][indexX] = cell;
}