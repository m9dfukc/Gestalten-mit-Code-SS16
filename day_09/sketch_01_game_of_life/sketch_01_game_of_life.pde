boolean pause = false;
int cellSize = 8;

int gridCountX;
int gridCountY;
int[][] grid;
int[][] buffer;

float randProbability = 0.9;

void setup() {
  size(600, 600);
  frameRate(20);
  noSmooth();
  background(255);
  
  gridCountX = width/cellSize;
  gridCountY = height/cellSize;

  grid = new int[gridCountY][gridCountX];
  buffer = new int[gridCountY][gridCountX];

  populate();
}

void populate() {
  for (int i=0; i < gridCountY; i++) {
    for (int j=0; j < gridCountX; j++) {
      grid[i][j] = (random(1) > randProbability) ? 1 : 0; //(i%2 == 0) ? 0 : 1;
    }
  }
}

void flush() {
  for (int i=0; i < gridCountY; i++) {
    for (int j=0; j < gridCountX; j++) {
      grid[i][j] = 0; 
    }
  }
}

void process() {
  // a live cell < 2 live neighbours = 0 in the next generation
  // a live cell 2 or 3 live neighbours = 1 in the next generation
  // a live cell > 3 live neighbours = 0 in the next generation
  // a dead cell == 3 live neighbours = 1 in the next generation

  for (int i=0; i < gridCountY; i++) {
    for (int j=0; j < gridCountX; j++) {

      int idxLeft     = (j > 0) ? j - 1 : gridCountX-1;
      int idxRight    = (j < gridCountX-1) ? j + 1 : 0;
      int idxTop      = (i > 0) ? i - 1 : gridCountY-1;
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

      int sum = left + right + top + bottom + topLeft + topRight + bottomLeft + bottomRight;

      if (current == 1) {
        buffer[i][j] = 1;
        if (sum < 2 || sum > 3) {
          buffer[i][j] = 0;
        }
      } else if (sum == 3) {
        buffer[i][j] = 1;
      }
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
        fill(0);
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
    populate();
  }
  if(key == 'c') {
    flush();
  }
}

void mousePressed() {
  int indexX = int(mouseX / cellSize);
  int indexY = int(mouseY / cellSize);
  int cell = grid[indexY][indexX];

  cell = (cell == 0) ? 1 : 0;
  grid[indexY][indexX] = cell;
}