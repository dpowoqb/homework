pathfinder[] paths;

void setup() {
  fullScreen();
  background(0);
  ellipseMode(CENTER);
  stroke(255);
  strokeWeight(0.5);
  paths = new pathfinder[1];
  paths[0] = new pathfinder();
}
void draw() {
  for (int i=0;i<paths.length;i++) {
    PVector loc = paths[i].location;
    float diam = paths[i].diameter;
    fill((int)random(0,10));
    ellipse(loc.x, loc.y, diam, diam);
    paths[i].update();
  }
}
class pathfinder {
  PVector location;
  PVector velocity;
  float diameter;
  pathfinder() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(10, -6);
    diameter = 25;
  }
  pathfinder(pathfinder parent) {
    location = parent.location.get();
    velocity = parent.velocity.get();
    float area = PI*sq(parent.diameter/8*4);
    float newDiam = sqrt(area/4*2/PI)*2;
    diameter = newDiam;
    parent.diameter = newDiam;
  }
  void update() {
    if (diameter>-0.5) {
      location.add(velocity);
      PVector force = new PVector(random(-1, 1), random(-1, 1));
      force.mult(0.45);
      velocity.add(force);
      velocity.normalize();
      if (random(0, 1)<0.02) {
        paths = (pathfinder[]) append(paths, new pathfinder(this));
      }
    }
  }
}
