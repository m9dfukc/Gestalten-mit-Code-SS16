class Walker {
  float x;
  float y;
  color c;
  int maxAge;
  int age;
  
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
    
    age = 0;
    maxAge = (int) random(1, 6000);
  }
  
  void update() {
    float stepx = random(-1, 1);
    float stepy = random(-1, 1);
    x += stepx;
    y += stepy;
    
    age++;
  }
  
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, 5, 5);
  }
  
  boolean isDead() {
    return (age > maxAge);
  }
  
  void draw() {
    this.update();
    this.display();
  }
}