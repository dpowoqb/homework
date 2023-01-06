float topR = 50;
float middleR = 135;
float bottomR = 70;
float topTall = 500;
float totalTall = 800;
int totalSides = 6;
void setup() {
  size(1000, 1000, P3D);
  background(0);
  noStroke();
}

void draw() {
  background(0);
  lights();
  translate(width/2, height/5);
  rotateY(map(mouseX, 0, width/2, 0, PI));
  rotateZ(map(mouseY, 0, height/2, 0, -PI));
  drawCylinder(topR, middleR ,bottomR ,topTall , totalTall , totalSides );
}

void drawCylinder(float topRadius, float middleRadius, float bottomRadius, float tall1, float tall2, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
 beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
    vertex(middleRadius * cos(angle+PI/sides), tall1, middleRadius * sin(angle+PI/sides));
    angle += angleIncrement;
  }
  endShape();
  
   beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    vertex(middleRadius * cos(angle+PI/sides), tall1, middleRadius * sin(angle+PI/sides));
    vertex(bottomRadius * cos(angle), tall2, bottomRadius * sin(angle)); 

    angle += angleIncrement;
  }
  endShape();
  
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
}
