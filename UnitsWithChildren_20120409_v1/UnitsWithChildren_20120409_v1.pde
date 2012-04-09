
ArrayList words;
String[] st = new String[1];
String[] tempSt;
Unit u = new Unit("Creativity");
Unit currentUnit = u;
String inputWord;

PFont f;

// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String saved = "";
String currentWord = "";

void setup() {
  size(800,800);
  f = createFont("Arial",16,true);

  words = new ArrayList();
  u.addChild("is");
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
  text(currentWord,indent,130);  


  pushMatrix();
  translate(100, height/2);
  u.display();
  popMatrix();
  
}

void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '\n' || key == '.' ) {
    saved = saved+' '+typing;
    u.reset();
//    st[count] = typing;

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
//String S = (String) words.get(0);
//typing = S;
currentWord = saved;
u.currentNode.integrateWord(currentWord);
//currentUnit.addChild(saved);
//currentUnit = (Unit) currentUnit.children.get(0);
typing = typing+' ';
inputWord = typing;

saved = "";

//String inputWord = typing;
  } else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key;
    saved = saved + key; 
  }
}

class Unit {
  String self; ArrayList children;Unit currentNode; 
  Unit (String self_in){
    self = self_in;
    children = new ArrayList();
    currentNode = this;
  }
  void addChild(String child_self) {
    children.add(new Unit(child_self));

  }
  void display() {
    
    text(self, 0, 0);  
    int numSiblings = children.size();
//    translate(textWidth(self), 0);
    rotate((-PI/8));
    for (int i = 0; i< numSiblings; i++){
      Unit C = (Unit) children.get(i);    
      
      pushMatrix();
       translate(100,0);
       C.display();
      popMatrix();
      rotate((PI/4)/(numSiblings-1));
    }  
  }

void integrateWord(String inputWord){

  
int numSiblings = children.size();

          if (numSiblings==0) {
          addChild(inputWord);
          currentNode = (Unit) children.get(0);
        }
else{
int matchDetected = 0;
for (int i = 0; i< numSiblings; i++){

      Unit currentSibling = (Unit) children.get(i);
        if (inputWord == currentSibling.self) {
          currentNode = (Unit) children.get(i);
          matchDetected = 1;
        }
        if (i==(numSiblings-1) & matchDetected==0) {
          addChild(inputWord);
          currentNode = (Unit) children.get(i+1);
        }
}
}
}

void reset(){
  currentNode = this;
}
  
}
