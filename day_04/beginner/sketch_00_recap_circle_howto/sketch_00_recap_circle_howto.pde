// Gestalten mit Code - day 04 - beginner lectures

/**
 * Trigonometry
 * Recap how to draw a circle using sine and cosine
 *
 * Task: 
 * add second time stream for cosFunc
 * shift cosFunc by some amount of PI
 */
 
 
 float t = 0;
 float speed = 0.008;
 float centerX;
 
 void setup() {
   size(600, 600);
   centerX = (width / 2.0);
 }
 
 void draw() {
   background(255);
   
   float sinFunc = sin(t);
   float cosFunc = cos(t);
   
   float posX = map(sinFunc, -1, 1, 50, height-50);
   float posY = map(cosFunc, -1, 1, 50, height-50);
   
   fill(0);
   
   text(sinFunc, posX+15, centerX+3);
   text(cosFunc, centerX+15, posY+3);
   text(nf(sinFunc, 1, 3) + " " + nf(cosFunc, 1, 3), posX+15, posY+15);
   
   stroke(128);
   line(posX, centerX, posX, posY);
   line(centerX, posY, posX, posY);
   
   noStroke();
   fill(255, 0, 0);
   ellipse(posX, centerX, 10, 10);
   
   fill(0, 0, 255);
   ellipse(centerX, posY, 10, 10);
   
   fill(0, 255, 0);
   ellipse(posX, posY, 20, 20);
   
   t = t + speed;
 }