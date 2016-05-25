class Walker {
  float x;
  float y;
  color c;
  
  Walker() {
    this(width/2, height/2); 
  }
  
  Walker(float x, float y) {    
    this(x, y, color(random(255), random(255), random(255)));
  }
  
  Walker(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
  void update() {
    float stepx = random(-1, 1);
    float stepy = random(-1, 1);
    x += stepx;
    y += stepy;
  }
  
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, 5, 5);
  }
  
  
  void draw() {
    this.update();
    this.display();
  }
}