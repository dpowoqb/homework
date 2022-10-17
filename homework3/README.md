PImage img;
float a=1;float b=1;
void setup() 
{
  frameRate(2);
  size(800, 733);
  img=loadImage("https://github.com/dpowoqb/homework/blob/main/homework3/%E6%95%88%E6%9E%9C%E4%B8%80.jpg?raw=true");
}
void draw() 
{
  background(0);
  a = a+b;
  if(a> 8 || a <2)
  {
  b= b*-1;}
  for(int i=0;i<width;i+=7)
  {
    for(int j=0;j<height;j+=7)
    { 
  color c= img.get(i,j);
  fill(c);
  stroke(c);
  ellipseMode(CORNER);
  ellipse(i,j, a, a);
    }
  }
}

