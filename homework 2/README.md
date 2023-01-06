color cols[]={color(0),color(0),color(0), color(255), color(255,255,0),color(255, 0, 0), color(255, 255, 0), color(0, 0, 255)};
void setup() {
  size(500, 500);strokeWeight(3);
  int x=0, y=0;
  while (x<500) {
    float w=random(10, 100);
    while (y<500) {
      float h=random(10, 100);
      fill(cols[int(random(cols.length))]);
      rect(x, y, w, h);
      y+=h;
    }
    x+=w;
    y=0;
  }
}

void draw() {
}
void keyPressed() {
  if (key==' ') {
    int x=0, y=0;
    while (x<500) {
      float w=random(10, 100);
      while (y<500) {
        float h=random(10, 100);
        fill(cols[int(random(cols.length))]);
        rect(x, y, w, h);
        y+=h;
      }
      x+=w;
      y=0;
    }
  }
}
