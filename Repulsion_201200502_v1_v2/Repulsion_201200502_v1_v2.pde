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
// b1.vx = b1.vx*(1-sq(.0001*(b1.xpos-b2.xpos)));
// b2.vx = b2.vx*(1-sq(.0001*(b1.xpos-b2.xpos)));
//  b1.vy = b1.vy*(1-sq(.0001*(b1.ypos-b2.ypos)));
// b2.vy = b2.vy*(1-sq(.0001*(b1.ypos-b2.ypos)));
  if(abs(b1.xpos-b2.xpos)<50){
    fill(255); b1.ax = 1;
  }else{fill(0); b1.ax = 0;}
  b1.move();
  b2.move();
  

//  b1.update();
//  b2.update();
}
  


class Ball {
  float xpos, ypos, vx, vy, ax, ay; Ball other;
  ArrayList others;
//  Ball(float xin, float yin, ArrayList oin){
//    xpos = xin; ypos = yin;
//  }
  Ball(float xin, float yin, Ball oin){
    xpos = xin; ypos = yin;
    vx = random(10);
    vy = random(10);
    other = oin;
    
  }
  
  void move() {
   if((xpos>=sz)||(xpos<=0)){vx = -vx;}
   if((ypos>=sz)||(ypos<=0)){vy = -vy;}
    xpos = xpos + vx;
    ypos = ypos + vy;
    vx = vx + ax;
    vy = vy + ay;
    
  }
    
    
//  void addOther(Ball newin) {
//    others.add(new Ball(newin));
//  }
  
  void display() {
    ellipse(xpos, ypos, 20, 20);
  }
  void repel(Ball bin) {
//  vx = vx*(xoin);
//  vy = vy*(yoin);
//  vx = vx*(vx-xoin);
//  vy = vy;
//vx = vx(1+sqrt(xpos-bin.xpos));

  }
  
}

    
    
