

void setup() {
  size(400, 400); 
  colorMode(RGB);
  smooth();
  noFill();
}

void draw() {
  background(255);
  
  for (int i = 0; i < 90; i++) {
    float t = map(i, 0, 90, 0, TWO_PI); 
    float x = sin(t);
    float y = cos(t);
    
    float posX1 = map(x, -1, 1, 0.45*width, 0.55*width);
    float posY1 = map(y, -1, 1, 0.45*height, 0.55*height);
    
    float posX2 = map(x, -1, 1, 0.25*width, 0.75*width);
    float posY2 = map(y, -1, 1, 0.25*height, 0.75*height);
       
    float continious = sin(map(i, 0, 90, 0, PI));
    float brightness = map(continious, 0, 1, 0, 255);
    
    stroke(brightness);
    line(posX1, posY1, posX2, posY2);
  }
  
}