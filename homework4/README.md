
void setup() {
  size(400, 400, P3D);
  background(0);
  noStroke();
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/2);
  rotateY(0.5);
  fill(255);
  translate(0, -50, 0);
  drawBottole(50, 100, 50, 300,500,7);//you can change the conuts here to change the look of the bottle
}

void drawBottole(float topR, float middleR,float bottomR, float tall1, float tall2,int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i <= sides; i++) {
    vertex(topR * cos(angle), 0, topR * sin(angle));
    vertex(middleR * cos(angle), tall1, middleR * sin(angle));
    angle += angleIncrement;
  }
  endShape();
  
  if (topR != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topR * cos(angle), 0, topR * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
   beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    vertex(middleR * cos(angle), tall1, middleR * sin(angle));
    vertex(bottomR * cos(angle), tall2, bottomR * sin(angle));
    
    angle += angleIncrement;
  }
  endShape();
  
  if (bottomR != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    vertex(0, tall2, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomR * cos(angle), tall2, bottomR * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
}
