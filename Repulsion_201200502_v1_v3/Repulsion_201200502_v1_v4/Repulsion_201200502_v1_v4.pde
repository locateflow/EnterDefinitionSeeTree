int sz = 800;
Ball b1, b2;

void setup(){
  size(sz, sz);
  b1 = new Ball(random(height), random(width), b2);
  b2 = new Ball(random(height), random(width), b1);
  frameRate(100);
}

void draw() {
  background(125);
  b1.display();
  b2.display();
  b1.repel(b2);
  b2.repel(b1);

b1.ax = b1.ax-sqrt(b1.vx - b2.vx);
if (b1.ax>width-5 | b1.ax<5){
  b1.ax = 0;
}
  
  b1.move();
  b2.move();
  
}
  
class Ball {
  float xpos, ypos, vx, vy, ax, ay; Ball other;
  ArrayList others;

  Ball(float xin, float yin, Ball oin){
    xpos = xin; ypos = yin;
    vx = random(10);
    vy = random(10);
    other = oin;
    
  }
  
  void move() {
   if((xpos>=sz)||(xpos<=0)){vx = -vx; ax = -ax;}
   if((ypos>=sz)||(ypos<=0)){vy = -vy; ay = -ay;}
    
    xpos = xpos + vx;   
    ypos = ypos + vy;    
    vx = vx + ax;    
    vy = vy + ay;
    
  }
  
  void display() {
    ellipse(xpos, ypos, 20, 20);
  }
  void repel(Ball bin) {

  }
  
}

    
    
