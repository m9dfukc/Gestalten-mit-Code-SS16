class Boid {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float maxSpeed;
  float maxForce;
  
  Boid(float x, float y) {
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    position = new PVector(x, y);
    
    maxSpeed = 3;
    maxForce = 0.1;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target, position);
    //desired.normalize();
    //desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, velocity);
    //steer.limit(maxForce);
    applyForce(steer);
  }
  
  void arrive(PVector target) {
    PVector desired = PVector.sub(target, position);
 
    float d = desired.mag();
    desired.normalize();
    if (d < 100) {
      float m = map(d, 0, 100, 0, maxSpeed);
      desired.mult(m);
    } else {
      desired.mult(maxSpeed);
    }
 
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void display() {
    float theta = velocity.heading() + PI/2;
    fill(255, 0, 0);
    noStroke();
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape();
    vertex(0, -8);
    vertex(-4, 8);
    vertex(4, 8);
    endShape(CLOSE);
    popMatrix();
  }
  
  void draw() {
    update();
    display();
  }
}