// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 18-1: User input
//ArrayList units;
ArrayList words;
String[] st = new String[1];
int count = 0;
String[] tempSt;
//Unit u;
String S;

PFont f;

// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String saved = "";

void setup() {
  size(800,800);
  f = createFont("Arial",16,true);
//  units = new ArrayList();
words = new ArrayList();
}

void draw() {
  background(255);
  int indent = 25;
  
  // Set the font and fill for text
  textFont(f);
  fill(0);
  
  // Display everything
  text("Click in this applet and type. \nHit return to save what you typed. ", indent, 40);
  text(typing,indent,90);
  text(saved,indent,130);
}

void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '\n' ) {
    saved = typing;
//    st[count] = typing;
    count = count + 1;
    tempSt = st;
//    String[] st = new String[count+1];
//    units.add(new Unit(typing));
words.add(new String(typing));
    // A String can be cleared by setting it equal to ""
    typing = ""; 
  } 
  if (key == ' '){
//    u = units.get(0);
//    Unit u = (Unit) units.get(0);
//    typing = u.self;
String S = (String) words.get(0);
typing = S;
  } else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key; 
  }
}

class Unit {
  String self; ArrayList children; 
  Unit (String self_in){
    self = self_in;
    children = new ArrayList();
  }
  void addChild(String child_self){
    children.add(new Unit(child_self));
  }  
}
