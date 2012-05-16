int sz = 800;
Ball b1, b2;

void setup(){
  size(sz, sz);
  b1 = new Ball(random(height), random(width), b2, "b1");
  b2 = new Ball(random(height), random(width), b1, "b2");
  frameRate(30);
}

void draw() {
  background(125);

  
  b1.display();
  b2.display();
  b1.ax = (b1.vx - (b2.xpos-b1.xpos)*sqrt(b2.xpos-b1.xpos));
  b1.ay = (b1.vy - (b2.ypos-b1.ypos)*sqrt(b2.ypos-b1.ypos));

//  b1.vy = b1.vy+((.03*(b2.ypos-b1.ypos))*sqrt(b2.ypos-b1.ypos));

  
  b1.move();
  b2.move();

}
  


class Ball {
  float xpos, ypos, vx, vy, ax, ay; Ball other; String name;
  ArrayList others;

  Ball(float xin, float yin, Ball oin, String namein){
    xpos = xin; ypos = yin;
    vx = random(10);
    vy = random(10);
    other = oin;
    ax = 0;
    ay = 0;
    name = namein;
    
  }
  
  void move() {
   if((xpos>=sz)||(xpos<=0)){vx = -vx;}
   if((ypos>=sz)||(ypos<=0)){vy = -vy;}
    xpos = xpos + vx;
    ypos = ypos + vy;
    
  }
    
    
  void display() {
    ellipse(xpos, ypos, 20, 20);
    text(name, xpos, ypos);
    
  }
  void repel(float xoin, float yoin) {
//  vx = vx*(xoin);
//  vy = vy*(yoin);
  vx = vx*xoin;
//  vy = vy;
  }
  
}

    
    
