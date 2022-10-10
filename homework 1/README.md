##homework 1##
void setup() {
  size(500, 500);
  noStroke();
  for (int i=0; i<50; i++) {
    fill(random(255), random(255), random(255));
    rect(0, i*10, 500, 10);
  }
}
void draw() {
}
void keyPressed() {
  if (key==' ') {
    noStroke();
    for (int i=0; i<50; i++) {
      fill(random(255), random(255), random(255));
      rect(0, i*10, 500, 10);
    }
  }
}
