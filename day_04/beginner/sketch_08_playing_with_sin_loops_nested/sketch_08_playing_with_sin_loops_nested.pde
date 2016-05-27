// Gestalten mit Code - day 04 - beginner lectures

/**
 * Nested loops variation
 * using sine function to offset y2 positions
 *
 */

int num = 40;

void setup() {  
  size(600, 600);
  smooth(8);
}

void draw() {
  background(255);
  
  int counter = 0;
  for (int i=0; i <= num; i++) {
    
    for (int j=0; j <= num; j++) {
      
      float posX = map(i, 0, num, 20, width-20);
      float posY = map(j, 0, num, 20, height-20);
      
      float t = map(counter, 0, (40*40), 0, 3*TWO_PI);
      float sinFunc = sin(t);
      
      float add = map(sinFunc, -1, 1, 0, 10);
      
      line(posX, posY, posX+5, posY+add);
      
      counter++;
    }
    
  }
}