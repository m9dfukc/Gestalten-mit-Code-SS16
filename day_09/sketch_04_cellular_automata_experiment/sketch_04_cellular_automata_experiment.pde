boolean pause = false;
int cellSize = 1;

int gridCountX;
int gridCountY;
int[][] grid;
int[][] buffer;

float randProbability = 0.2;

void setup() {
  size(600, 600);
  frameRate(30);
  noSmooth();
  background(255);
  
  gridCountX = int(width/cellSize);
  gridCountY = int(height/cellSize);

  grid       = new int[gridCountY][gridCountX];
  buffer     = new int[gridCountY][gridCountX];

  grid       = populate(grid);
}

int[][] populate(int[][] g) {
  int rows = g.length;
  int cols = (rows > 0) ? g[0].length : 0;
  for (int i=0; i < rows; i++) {
    for (int j=0; j < cols; j++) {
      g[i][j] = (i%2 == 0) ? 0 : 1; // (random(1) > randProbability) ? 1 : 0;
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
  // a live cell < 2 live neighbours = 0 in the next generation
  // a live cell 2 or 3 live neighbours = 1 in the next generation
  // a live cell > 3 live neighbours = 0 in the next generation
  // a dead cell == 3 live neighbours = 1 in the next generation
  int[][] buffer = new int[gridCountY][gridCountX];
  for (int i=1; i < gridCountY-1; i++) {
    for (int j=1; j < gridCountX-1; j++) {

      int idxLeft     = j - 1; //(j > 0) ? j - 1 : gridCountX-1;
      int idxRight    = j + 1; //(j < gridCountX-1) ? j + 1 : 0;
      int idxTop      = i - 1; //(i > 0) ? i - 1 : gridCountY-1;
      int idxBottom   = i + 1; //(i < gridCountY-1) ? i + 1 : 0;

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

      //if (current == 1) {
      //  buffer[i][j] = 1;
      //  if (sum < 2 || sum > 3) {
      //    buffer[i][j] = 0;
      //  }
      //} else if (sum == 3) {
      //  buffer[i][j] = 1;
      //}
      
      //// Add up all the states in a 3x3 surrounding grid
      //int sum = 0;
      //int current = grid[i][j];
      //for (int a = -1; i <= 1; i++) {
      //  for (int b = -1; j <= 1; j++) {
      //    sum += grid[i+b][j+a];
      //  }
      //}
    
      //// A little trick to subtract the current cell's state since
      //// we added it in the above loop
      //sum -= current;

      // Rules of Life
      if      ((current == 1) && (sum <  2)) buffer[i][j] = 1;        // Loneliness
      else if ((current == 1) && (sum >  3)) buffer[i][j] = 0;        // Overpopulation
      else if ((current == 0) && (sum == 3)) buffer[i][j] = 1;        // Reproduction
      else                                   buffer[i][j] = current;  // Stasis
    }
  } 
  grid = buffer;
}

void draw() {
  background(255);
  for (int i=0; i < gridCountY; i++) {
    for (int j=0; j < gridCountX; j++) {
      int cell = grid[i][j];
      noStroke();
      if (cell == 1) {
        if (j > 0 && i > 0) {
          boolean horizontal = grid[i-1][j] == 1;
          boolean vertical = grid[i][j-1] == 1;
          if (horizontal) {
           fill(255, 0, 0); 
          } else if (vertical) {
           fill(0, 255, 0);  
          }
        } else {
          fill(0);
        }
        rect(j*cellSize, i*cellSize, cellSize, cellSize);
      }
    }
  }

  if (pause) {
    fill(255);
    rect(13, 7, 60, 19);
    fill(255, 0, 0);
    text("paused!", 20, 20);
  } else {
    process();
    fill(255);
    rect(13, 7, 60, 19);
    fill(0, 255, 0);
    text("running!", 20, 20);
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

void mousePressed() {
  int indexX = int(mouseX / cellSize);
  int indexY = int(mouseY / cellSize);
  int cell = grid[indexY][indexX];

  cell = (cell == 0) ? 1 : 0;
  grid[indexY][indexX] = cell;
}