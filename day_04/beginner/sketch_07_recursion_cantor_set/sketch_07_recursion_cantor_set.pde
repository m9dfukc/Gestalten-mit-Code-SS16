/* 
 * Let’s talk about the first appearance of fractals in modern mathematics. 
 * In 1883, German mathematician George Cantor developed simple rules to 
 * generate an infinite set. The so called "Cantor ternary set":
 *
 * 1. Start with a line.                    ---------------------------
 * 2. Erase the middle third of that line   ---------         ---------
 * 3. Repeat step 2 for the remaining       ---   ---         ---   ---
 *    lines and start over again            - -   - -         - -   - -
 *    
 * This process is continued ad infinitum (not in our case ;)
 */


void setup() {
  size(700, 300);
  background(230);
  
  strokeCap(SQUARE);
  strokeWeight(10);
  noSmooth();
  
  cantor(20, 40, width-40);
}

// step 1:
//void cantor(float x, float y, float len) {
//  line(x,y,x+len,y);
//}

// step 2:
//void cantor(float x, float y, float len) {
//  line(x,y,x+len,y);
  
//  y += 30;
 
//  line(x,y,x+len/3,y); // from start to 1/3rd
//  line(x+len*2/3,y,x+len,y); // from 2/3rd to end
//}

// step 3:
void cantor(float x, float y, float len) {
  if (len >= 1) { // this "exit condition" is crucial!!! 
    line(x,y,x+len,y);
    y += 30;
    cantor(x,y,len/3.0);
    cantor(x+len*2/3.0,y,len/3.0);
  }
}