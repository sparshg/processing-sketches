//Written in processing, https://processing.org/

PVector pos, vel, acc;
float mass = 100;
//spring constant
float k = 1;

void setup() {
  size(400, 400);
  pos = new PVector(100, 0);
  vel = new PVector(0, 0);
  acc = new PVector(0, 0);
}

void draw() {
  background(255);
  translate(width/2, height/2);

  //ma = -kx, so a = -kx/m
  acc = PVector.mult(pos, -k/mass);
  
  vel.add(acc);
  pos.add(vel);
  
  //Draw stuff
  fill(0);
  ellipse(0, 0, 5, 5);
  line(0, 0, pos.x, pos.y);
  ellipse(pos.x, pos.y, 20, 20);
}
