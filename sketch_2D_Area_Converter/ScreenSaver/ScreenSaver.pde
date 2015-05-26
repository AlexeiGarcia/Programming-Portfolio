Lines[] myLines = new Lines [10];

void setup() {
  background(0);
  size(800,800);
  //myLines1 = new Lines(random(width), random(height), random(1,5), random(1,20));
  for(int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(1,5), random(1,20));
  }
}

void draw() {
  //myLines1.display();
  for(int i=0; i<myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
  }
  if (frameCount>2000) {
    background(0);
    frameCount = 0;
  }
}
class Lines {
  //class variables
  float xpos;
  float ypos;
  float strokeW;
  float lineLength;
  
  //constructor
  Lines(float tempX, float tempY, float tempStroke, float tempLength) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    lineLength = tempLength;
  }
  
  //display
  void display() {
    strokeW = random(1,5);
    lineLength = random(1,50);
    //stroke(random(100,255));
    stroke(random(155, 255));
    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = 0;
    } else {
      if (random(100)>45) {
        strokeWeight(strokeW);
        moveDown(xpos, ypos, lineLength);
      } else if (random(100)>80) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, lineLength);
      } else if (random(100)>80) {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      } else {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, lineLength);
      }
    }
  }

 

  void draw() {
    strokeW = random(1, 5);
    lineLength = random(1, 20);
    stroke(0);
    strokeWeight(strokeW);
    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = 0;
    } else {
      if (random(100)>45) {
        strokeWeight(strokeW);
        moveDown(xpos, ypos, lineLength);
      } else if (random(100)>80) {
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, lineLength);
      } else if (random(100)>80) {
        strokeWeight(strokeW);
        moveRight(xpos, ypos, lineLength);
      } else {
        strokeWeight(strokeW);
        moveUp(xpos, ypos, lineLength);
      }
    }
  }

  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY);
      xpos = startX + i;
      ypos = startY;
    }
  }

  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY);
      xpos = startX - i;
      ypos = startY;
    }
  }

  void moveUp(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY-i);
      xpos = startX;
      ypos = startY-i;
    }
  }

  void moveDown(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX, startY+i);
      xpos = startX;
      ypos = startY+i;
    }
  }
  
  void moveUpRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY-i);
      xpos = startX+i;
      ypos = startY-i;
    }
  }
  
  void moveUpLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY-i);
      xpos = startX-i;
      ypos = startY-i;
    }
  }
  
  void moveDownRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+i, startY+i);
      xpos = startX+i;
      ypos = startY+i;
    }
  }
  
  void moveDownLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-i, startY+i);
      xpos = startX-i;
      ypos = startY+i;
    }
  }
}


