String[] tempSt;
Unit u = new Unit("");

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

  u.addChild("creativity");
//  u.addChild("could");
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
  text("currentWord: "+currentWord,indent,130);
  
  text("u.currentNode.self: "+u.currentNode.self,indent,170);
  text("children:",indent, 210);
  Unit X;
  for (int i = 0; i<u.currentNode.children.size();i++){
    X = (Unit) u.currentNode.children.get(i);
    text(X.self,indent,250+40*i);
  }
    


  pushMatrix();
  translate(100, height/2);
  u.display();
  popMatrix();
  
}

void keyPressed() {
  // If the return key is pressed, save the String and clear it
  if (key == '\n') {
   u.reset();
   typing = "";
   saved = "";
   currentWord = "";
  } 
  if (key == '.' ) {
    currentWord = saved;
    u.integrateWord(currentWord);
    u.reset();
   typing = "";
   saved = "";
   currentWord = "";
    
  } 
  if (key == ' '){
    currentWord = saved;
    typing = typing+' ';
    inputWord = typing;
    u.integrateWord(currentWord);

    saved = "";
  } else if (key != '.' ) {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key;
    saved = saved + key; 
  }
}

class Unit {
  String self; ArrayList children; Unit currentNode; 
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
    translate(textWidth(self),0);
    rotate((-PI/4));
    rotate((PI/4)/(numSiblings));
    for (int i = 0; i< numSiblings; i++){
      Unit C = (Unit) children.get(i);          
      pushMatrix();
       line(0,0,100,0);
       translate(100,0);
       C.display();
      popMatrix();
      rotate((PI/2)/(numSiblings));
    }  
  }

  void integrateWord(String inputWord){
////    if(currentNode.self.equals("")){
//      translate(50,50);}
    // Find out how many children the current unit has (numSiblings).  
    int numSiblings = currentNode.children.size();
    // If there are no children, then the input word becomes a child of the current node.
    if (numSiblings==0) {
      currentNode.addChild(inputWord);
      // We added a child to the current node and now that child becomes the relevant node.      
      currentNode = (Unit) currentNode.children.get(0);      
    }
    // If there is already a child or a number of children, compare the input with them.
    else{
      int matchDetected = 0;
      Unit X;
      
      
      for (int i = 0; i<currentNode.children.size();i++){
        X = (Unit) currentNode.children.get(i);
      
          if (inputWord.equals(X.self)) {        

          currentNode = (Unit) currentNode.children.get(i);
          matchDetected = 1;
        }
        else if (i==(numSiblings-1) & matchDetected==0) {
          currentNode.addChild(inputWord); 
          text("passed this", 20,20);         
//          currentNode = (Unit) children.get(i+1);
        }
      }
    }
  }

  void reset(){
    currentNode = this;
  }
  
}
