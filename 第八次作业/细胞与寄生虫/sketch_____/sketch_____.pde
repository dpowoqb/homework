float maxSpeed = 10;
int points = 6000;
float noise1;
float noiseSpeed1;
float stepNoiseXY;
float TP = TWO_PI;
float c1, c2;
dots tabParticles[];//声明粒子数组

void setup()
{
  fullScreen(P2D);
  background(0);
  c1 = random(60, 110);
  c2 = random(255 - c1);
  noise1 = random(12500);
  noiseSpeed1 = random(0.005, 0.015) ;
  stepNoiseXY = random(0.001, 0.01);
  tabParticles = new dots[points];
  for (int i = 0; i < points; i++) {
  tabParticles[i] = new dots();
  }
  background(255);
}



void draw()
{
  strokeWeight(random(1,15));
  fill(0, 90);
  noStroke(); 
  rect(0, 0, width, height);
  
  noise1 += noiseSpeed1;
  for (int i = 0; i < points; i++){
    tabParticles[i].update();
  }
}

void mousePressed() {
  c1 = random(60, 110);
  c2 = random(255 - c1);
  noise1 = random(12500);
  noiseSpeed1 = random(0.005, 0.015) ;
  stepNoiseXY = random(0.001, 0.01);
  tabParticles = new dots[points];
  for (int i = 0; i < points; i++) {
    tabParticles[i] = new dots();
  }
  background(255);
}


class dots {
  float x, y;
  color myColor;

  dots () {
    x = random(width);
    y = random(height);
    myColor = color(random(255),random(255), random(255));
  }


  void update(){
    float n = (noise(x*stepNoiseXY, y*stepNoiseXY, noise1));
    n = map(n,0.1,0.9, 0, TP);

    x += n*cos(n * TP) * maxSpeed;
    y += n*sin((1-n) * TP) * maxSpeed;

    if ((x < 0) || (x > width) || 
      (y < 0) || (y > height)) {
         x = random(width);
    y = random(height);
    myColor = color(c2 + c1 * n, 255, 255);
    }
    stroke(myColor, 80);
    point(x, y);
  }
}
