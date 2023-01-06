float a = 0;

void setup() {
  background(255);
  size(1000,1000);
  stroke(0, 10);
}

void draw() {
  a = a + 0.01;
  float n = noise(a) * width;
  line(n, 0, n, height);
  line(0,n,width,n);
  strokeWeight(5);
}
