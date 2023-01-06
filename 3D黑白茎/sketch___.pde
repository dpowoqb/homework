int num;
float all_diam;
float average_diam;
root[] r;
int name = 0;

void setup() {
  size(1000,1000);
  background(0);

  stroke(0);
  strokeWeight(0.35);

  num = int(random(30, 60));
  r = new root[num];

  for (int a = 0; a < r.length; a++) {
    r[a] = new root();
  }
}

void draw() {

  for (int b = 0; b < r.length; b ++) {
    r[b].update();
    ellipse(r[b].loc.x, r[b].loc.y, r[b].diam, r[b].diam);
    fill((int)random(0,255));
    all_diam += r[b].diam;
  }

  average_diam = all_diam/r.length-1; 
  all_diam = 0;

  if (average_diam <= 0.5) {
    name++;
    save("image"+name+".png");
    background(0);
    num = int(random(30, 60)); 
    r = new root[num];

    for (int j = 0; j < r.length; j++) {
      r[j] = new root();
    }

    for (int i = 0; i < r.length; i ++) {
      r[i].init();
    }
  }
} 

class root {

  PVector loc;
  PVector speed;
  PVector force;
  float diam = width/15;

  root() {
    loc = new PVector(width/2, height/2);
    speed = new PVector();
    speed = PVector.random2D();
    speed.mult(random(0,2));
    force = new PVector();
  }

  void init() {
    loc.x = width/2;
    loc.y = height/2;
    diam = width/15;
  }

  void update() {
    diam -= random(0.05, 0.1);
    diam = constrain(diam, 0.5, width/15);  
    if (diam > 0.5) {
      force = PVector.random2D();
      force.mult(random(0.3,1.5));
      speed.add(force);
      speed.normalize();
      loc.add(speed);
    }
  }
} 
