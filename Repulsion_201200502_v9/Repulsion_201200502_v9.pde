int sz = 800;
Ball b1, b2;
PVector F2 = new PVector(0, 0);

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


text(b1.pos.x, 100, 100);
text(b1.v.x, 200, 500);


//  b1.vy = b1.vy+((.03*(b2.ypos-b1.ypos))*sqrt(b2.ypos-b1.ypos));

  
  b1.move();
  b2.move();
  b1.repel(b2);
  b2.repel(b1);

}
  


class Ball {
  float xpos, ypos, vx, vy, ax, ay, Fx, Fy, Ex, Ey; 
//  Ball other; String name;
  PVector pos, v, a, F, E; Ball other; String name;
  ArrayList others;

  Ball(float xin, float yin, Ball oin, String namein){
//    pos.x = xin; pos.y = yin;
pos = new PVector(xin, yin);
v = new PVector(random(-10,10), random(-10,10));
a = new PVector(0, 0);
F = new PVector(0, 0);
    other = oin;

    name = namein;
    Ex = 0.5*sq(v.x);
    
  }
  
  void move() {
   if((pos.x>=sz-50)||(pos.x<=0)){v.x = -v.x;}
   if((pos.y>=sz-50)||(pos.y<=0)){v.y = -v.y;}
   pos.add(v);
   F.x = 0.5*sq(v.x);    F.y = 0.5*sq(v.y);
   v.x = v.x + v.x*a.x;
   v.y = v.y + v.y*a.y;
   v.dot(a);
   
    
  }
    
    
  void display() {
    ellipse(pos.x, pos.y, 20, 20);
    pushStyle();
    fill(0);
    textAlign(CENTER);
    textSize(40);
    text(name, pos.x, pos.y);
    popStyle();
    
  }
  void repel(Ball oin) {
    if (mouseX>width/2){
v.add(new PVector((100/(-oin.pos.x + pos.x)) - v.x, (100/(-oin.pos.y + pos.y)) - v.y));
    }else{
v.add(new PVector(((+oin.pos.x - pos.x)/25) - v.x, ((oin.pos.y - pos.y)/25) - v.y));    
    }
  }
  
}

    
    
