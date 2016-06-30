boolean pause = false;
int cellSize = 1;

int gridCountX;
int gridCountY;
int[][] grid;
int[][] buffer;

float randProbability = 0.05;

PImage img;

void setup() {
  size(600, 600);
  frameRate(60);
  noSmooth();
  background(255);
  
  gridCountX = int(width/cellSize);
  gridCountY = int(height/cellSize);
  img = createImage(gridCountX, gridCountY, RGB);

  grid       = new int[gridCountY][gridCountX];
  buffer     = new int[gridCountY][gridCountX];
 
  grid       = populate(grid);
}

int[][] populate(int[][] g) {
  int rows = g.length;
  int cols = (rows > 0) ? g[0].length : 0;
  for (int i=0; i < rows; i++) {
    for (int j=0; j < cols; j++) {
      g[i][j] = (i%7 == 0) ? 0 : 1;
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
  int[][] buffer = new int[gridCountY][gridCountX];
  for (int i=1; i < gridCountY-1; i++) {
    for (int j=1; j < gridCountX-1; j++) {

      int idxLeft     = (j > 0) ? j - 1 : j;
      int idxRight    = (j < gridCountX-1) ? j + 1 : 0;
      int idxTop      = (i > 0) ? i - 1 : i;
      int idxBottom   = (i < gridCountY-1) ? i + 1 : 0;

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

      // Rules of Life ... slightly modified
      if      ((current == 1) && (sum <  2)) buffer[i][j] = 0;        // Loneliness
      else if ((current == 0) && (sum >  3) && bottomLeft == 1) buffer[i][j] = 0;
      else if ((current == 1) && (sum >  3) && bottomRight == 1) buffer[i][j] = 1;
      else if ((current == 1) && (sum >  3)) buffer[i][j] = 0;        // Overpopulation
      else if ((current == 0) && (sum == 3)) buffer[i][j] = 1;        // Reproduction
      else                                   buffer[i][j] = current;  // Stasis
    }
  } 
  grid = buffer;
}

void draw() {
  println(frameRate);
  background(255);
  
  int index = 0;
  img.loadPixels();
  for (int i=0; i < gridCountY; i++) {
    for (int j=0; j < gridCountX; j++) {
      int cell = grid[i][j];
      color c = color(255);
      if (cell == 1) {
         
        if (j > 0 && i > 0) {
          
          boolean horizontal = grid[i-1][j] == 1;
          boolean vertical = grid[i][j-1] == 1;
          boolean diagonal = grid[i-1][j-1] == 1;
          if (diagonal) {
            c = color(0, 0, 255);
          } else {
            c = color(0);  
          }
        } else {
          c = color(0);
        }
        img.pixels[index] = c;
      } else {
        img.set(j, i, color(255, 255, 255));
      }
      index++;
    }
  }
  img.updatePixels();
  noTint();  // Disable tint
  image(img, 0, 0, width, height);
  
  if (!pause) process();
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
  int indexX = floor(mouseX / cellSize);
  int indexY = floor(mouseY / cellSize);
  int cell = grid[indexY][indexX];

  cell = (cell == 0) ? 1 : 0;
  grid[indexY][indexX] = cell;
}