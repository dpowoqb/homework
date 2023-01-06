PImage old;
PImage now;
int a = 0;
int change = 1;
int add = 2;


void setup(){
  frameRate(100);
  size(279,417);
  old = loadImage("001.jpg");
  now = createImage(old.width,old.height,RGB);
}
void draw(){
  background(0);
  int num = a;
  old.loadPixels();
  now.loadPixels();
  a = a + change;
  if(a<1 || a>254){
    change = change * (-1);
  }
  for(int x = 0;x<old.width;x=x+add){
    for (int y =0;y<old.height;y =y + add){
      int pos = x + y*old.width;
      if(brightness(old.pixels[pos])> num){
        now.pixels[pos] = color (255,a);
      }else{
        now.pixels[pos]= color (0,a);
      }
    }
  }
  now.updatePixels();
  image(now,0,0);
}
