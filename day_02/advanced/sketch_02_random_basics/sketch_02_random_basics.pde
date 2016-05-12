// Gestalten mit Code - day 02 - andvanced lectures

/**
 * shows the occurrences of random numbers between 0 - 99.
 * Note: over time the mean tends to go agains 49.5
 *
 */

long sum = 0;
int generation = 0;
int randMax = 100;
int[] occurrences = new int[randMax];

void setup() {
  size(400, 400);
  frameRate(30);
  textAlign(CENTER, CENTER);
  
  for(int i=0; i < randMax; i++) {
     occurrences[i] = 0;
  }
}

void draw() {
  background(#FFF5C3);
  generation++;
  int randNumber = (int) random(0, randMax);
  sum += randNumber;
  float mean = sum / (float)generation;
  
  // draw the occurencies of all numbers generated
  for (int i=0; i < randMax; i++) {
    int posX = (int) map(i, 0, 99, 0, width);
    int value = occurrences[i];
    
    if(i%10 == 0 && i != 0) {
      textSize(9);
      fill(#505050);
      text(i, posX, height - 10);
    }
    if (i == randNumber) { 
      stroke(#FF7260);
    } else {
      stroke(#9BD7D5);
    }
    strokeWeight(2);
    line(posX+2, height, posX+2, height - (value*2));
  }
  
  textSize(12);
  fill(#505050);
  text("random values between 0-99", width/2, 12);
  
  // draw our current random number, generation, and mean value
  textSize(38);
  fill(#FF7260);
  text(randNumber, width/2, 130);
  textSize(12);
  fill(#129793);
  text("generation "+generation, width/2, 172);
  text("mean "+nf(mean, 0, 2) , width/2, 187);
  
  // count up the occurrence of the current number
  occurrences[randNumber]++;
}