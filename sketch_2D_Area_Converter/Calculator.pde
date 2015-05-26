Button[] numButtons = new Button[10];
Button[] opButtons = new Button[11];
Button[] spButtons = new Button[1];

String displayValue = "0";
String valueToCompute = ""; //string value left of operator
String valueToCompute2 = ""; //string value right of operator
float valueToComputeI = 0;  //float value left of operator
float valueToComputeI2 = 0; //float value rihgt of operator
float result = 0;
char opValue;
boolean firstNum;
float a = pow(valueToComputeI, valueToComputeI2);
float decimal1 = 0;
float decimal2 = 0;

void setup() {
  size(310, 260);
  background(200);

  //Populate number buttons
  numButtons[0] = new Button(60, 220).asNumber(0, 90, 30);
  numButtons[1] = new Button(60, 180).asNumber(1, 40, 30);
  numButtons[2] = new Button(110, 180).asNumber(2, 40, 30);
  numButtons[3] = new Button(160, 180).asNumber(3, 40, 30);
  numButtons[4] = new Button(60, 140).asNumber(4, 40, 30);
  numButtons[5] = new Button(110, 140).asNumber(5, 40, 30);
  numButtons[6] = new Button(160, 140).asNumber(6, 40, 30);
  numButtons[7] = new Button(60, 100).asNumber(7, 40, 30);
  numButtons[8] = new Button(110, 100).asNumber(8, 40, 30);
  numButtons[9] = new Button(160, 100).asNumber(9, 40, 30);

  //Populate Operators
  opButtons[0] = new Button(260, 180).asOperator("=", 40, 70);
  opButtons[1] = new Button(210, 220).asOperator("+", 40, 30);
  opButtons[2] = new Button(210, 180).asOperator("-", 40, 30);
  opButtons[3] = new Button(210, 140).asOperator("*", 40, 30);
  opButtons[4] = new Button(210, 100).asOperator("/", 40, 30);
  opButtons[5] = new Button(260, 100).asOperator("C", 40, 30);
  opButtons[6] = new Button(260, 140).asOperator("+/-", 40, 30);
  opButtons[7] = new Button(10, 220).asOperator("%", 40, 30);
  opButtons[8] = new Button(10, 100).asOperator("x^2", 40, 30);
  opButtons[9] = new Button(10, 140).asOperator("Sqrt", 40, 30);
  opButtons[10] = new Button(10, 180).asOperator("^", 40, 30);

  //Populate Special Buttons
  spButtons[0] = new Button(160, 220).asSpecial(".", 40, 30);


  //Set the initial value of the first num to true
  firstNum = true;
}

void draw() {
  //Draw number buttons
  for (int i = 0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.display();
  }
  for (int i=0; i<opButtons.length; i++) {
    Button iopButton = opButtons[i];
    iopButton.display();
  }
  for (int i=0; i<spButtons.length; i++) {
    Button ispButton = spButtons[i];
    ispButton.display();
  }
  updateDisplay();
}

void updateDisplay() {
  fill(220, 255, 255);
  rect(10, 10, 290, 80, 7);
  fill(0);
  textSize(25);
  text(displayValue, 20, 37);

  fill(220, 255, 255);
  noStroke();
  rect(15, 45, 280, 40);
  fill(0);
  textSize(15);
  text("Val 1: " + valueToCompute, 20, 60);
  text("Val 2: " + valueToCompute2, 20, 80);
  text("Result: " + result, 140, 60);
  text("Operator: " + opValue, 140, 80);
}

void performCalculation() {
  //Set string values to integers
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);

  //perform calculation based on the appropriate operator
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'n') {
    if (firstNum) {
      valueToComputeI = valueToComputeI*-1;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2*-1;
      displayValue = str(valueToComputeI2);
    }
  } else if (opValue == '%') {
    if (firstNum) {
      valueToComputeI = valueToComputeI * 0.0100000000000;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2 * 0.0100000000000;
      displayValue = str(valueToComputeI2);
    }
  } else if (opValue == '√') {
    if (firstNum) {
      valueToComputeI = sqrt(valueToComputeI);
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = sqrt(valueToComputeI2);
      displayValue = str(valueToComputeI2);
    }
  } else if (opValue == 's') {
    if (firstNum) {
      valueToComputeI = valueToComputeI * valueToComputeI;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2 * valueToComputeI2;
      displayValue = str(valueToComputeI2);
    }
  } else if (opValue == 'p') {
    result = pow(valueToComputeI, valueToComputeI2);
    displayValue = str(result);
  }
  // let = work multiple times
  if (firstNum) {
    valueToCompute = displayValue;
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.click();
    if (inumButton.on) {
      if (firstNum) {
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    Button iOpButton = opButtons[i];
    iOpButton.click();
    if (iOpButton.on) {
      decimal1 = 0;
      if (iOpButton.opButtonValue == "+") {
        if (result !=0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iOpButton.opButtonValue == "=") {
        //Perform calculation
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "-") {
        if (result !=0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (iOpButton.opButtonValue == "*") {
        if (result !=0) {
          opValue = '*';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "*";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "*";
        }
      } else if (iOpButton.opButtonValue == "/") {
        if (result !=0) {
          opValue = '/';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "/";
        } else {
          opValue = '/';
          firstNum = false;
          displayValue = "/";
        }
      } else if (iOpButton.opButtonValue == "C") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI2 = 0;
        result = 0;
        firstNum = true;
        decimal1 = 0;
        decimal2 = 0;
      } else if (iOpButton.opButtonValue == "+/-") {
        opValue = 'n';
        performCalculation();
      } else if (iOpButton.opButtonValue == "%") {
        opValue = '%';
        performCalculation();
      } else if (iOpButton.opButtonValue == "Sqrt") {
        opValue = '√';
        performCalculation();
      } else if (iOpButton.opButtonValue == "x^2") {
        opValue = 's';
        performCalculation();
      } else if (iOpButton.opButtonValue == "^") {
        if (result !=0) {
          opValue = 'p';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "^";
        } else {
          opValue = 'p';
          firstNum = false;
          displayValue = "^";
        }
      }
    }
  }
  for (int i=0; i<spButtons.length; i++) {
    Button iSpButton = spButtons[i];
    iSpButton.click();
    if (iSpButton.on) {
      if (iSpButton.spButtonValue == ".") {
        if (decimal1 < 1 && decimal2 < 1) {
          // concantenate the values clicked on
          if (iSpButton.on && firstNum == true) {
            valueToCompute += iSpButton.spButtonValue;
            displayValue = valueToCompute;
            decimal1 += 1;
          } else if (iSpButton.on && firstNum == false) {
            valueToCompute2 += iSpButton.spButtonValue;
            displayValue = valueToCompute2;
            decimal2 += 1;
          }
        }
      }
    }
  }
}

void keyPressed() {
  if (key == '1') {
    handleKeyPressNum("1");
  } else if (key == '2') {
    handleKeyPressNum("2");
  } else if (key == '3') {
    handleKeyPressNum("3");
  } else if (key == '4') {
    handleKeyPressNum("4");
  } else if (key == '5') {
    handleKeyPressNum("5");
  } else if (key == '6') {
    handleKeyPressNum("6");
  } else if (key == '7') {
    handleKeyPressNum("7");
  } else if (key == '8') {
    handleKeyPressNum("8");
  } else if (key == '9') {
    handleKeyPressNum("9");
  } else if (key == '0') {
    handleKeyPressNum("0");
  } else if (key == 'C' || key == 'c') {
    handleKeyPressOp("C");
  } else if (key == '=') {
    handleKeyPressOp("=");
  } else if (key == '+') {
    handleKeyPressOp("+");
  } else if (key == '-') {
    handleKeyPressOp("-");
  } else if (key == '*') {
    handleKeyPressOp("*");
  } else if (key == '/') {
    handleKeyPressOp("/");
  }
}  

void handleKeyPressNum(String keyPress) {
  if (firstNum) {
    valueToCompute += keyPress;
    displayValue = valueToCompute;
  } else {
    valueToCompute2 += keyPress;
    displayValue = valueToCompute2;
  }
}

void handleKeyPressOp(String keyPress) {
  if (keyPress == "C" || keyPress == "c") {
    displayValue = "0";
    opValue = 'C';
    valueToCompute = "";
    valueToCompute2 = "";
    valueToComputeI = 0;
    valueToComputeI2 = 0;
    result = 0;
    firstNum = true;
    decimal1 = 0;
    decimal2 = 0;
  } else if (keyPress == "=" || keyPress == "return") {
    //Perform Calculation
    firstNum = true;
    performCalculation();
  } else if (keyPress == "+") {
    if (result !=0) {
      opValue = '+';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "+";
    } else {
      opValue = '+';
      firstNum = false;
      displayValue = "+";
    }
  } else if (keyPress == "-") {
    if (result !=0) {
      opValue = '-';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "-";
    } else {
      opValue = '-';
      firstNum = false;
      displayValue = "-";
    }
  } else if (keyPress == "*") {
    if (result !=0) {
      opValue = '*';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "*";
    } else {
      opValue = '*';
      firstNum = false;
      displayValue = "*";
    }
  } else if (keyPress == "/") {
    if (result !=0) {
      opValue = '/';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "/";
    } else {
      opValue = '/';
      firstNum = false;
      displayValue = "/";
    }
  }
}

class Button {
  //Class variables
  boolean isNumber;
  boolean isOperator;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float x;
  float y;
  float w;
  float h;
  boolean on;

  //Constructor
  Button(float tempX, float tempY) {
    x = tempX;
    y = tempY;
    //println(numButtonValue);
  }

  //Constructor for number buttons
  Button asNumber(float tempNumButtonValue, float tempW, float tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    w = tempW;
    h = tempH;
    return this;
  }

  Button asOperator(String tempOpButtonValue, float tempW, float tempH) {
    isOperator = true;
    opButtonValue = tempOpButtonValue;
    w = tempW;
    h = tempH;
    return this;
  }

  Button asSpecial(String buttonValue, float tempW, float tempH) {
    isSpecial = true;
    spButtonValue = buttonValue;
    w = tempW;
    h = tempH;
    return this;
  }

  //Draw the button on the canvas
  void display() {
    //Draw rounded edged button on canvas
    if (isNumber) {
      fill(0, 255, 255);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h, 7);
      fill(122, 44, 22);
      textSize(15);
      text(int(numButtonValue), x+15, y+20);
    } else if (isOperator) {
      fill(0, 255, 255);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h, 7);
      fill(122, 44, 22);
      textSize(15);
      text(opButtonValue, x+15, y+20);
      if(opButtonValue == "+/-") {
        fill(0, 255, 255);
        stroke(0);
        strokeWeight(2);
        rect(x, y, w, h, 7);
        fill(122, 44, 22);
        textSize(15);
        text("±", x+15, y+20);
      } else if (opButtonValue == "Sqrt") {
        fill(0, 255, 255);
        stroke(0);
        strokeWeight(2);
        rect(x, y, w, h, 7);
        fill(122, 44, 22);
        textSize(15);
        text("√", x+15, y+20);
      } else if (opButtonValue == "%") {
        fill(0, 255, 255);
        stroke(0);
        strokeWeight(2);
        rect(x, y, w, h, 7);
        fill(122, 44, 22);
        textSize(15);
        text("%", x+15, y+20);
      } else if (opButtonValue == "x^2") {
        fill(0, 255, 255);
        stroke(0);
        strokeWeight(2);
        rect(x, y, w, h, 7);
        fill(122, 44, 22);
        textSize(15);
        text(opButtonValue, x+7, y+20);
      } else if (opButtonValue == "^") {
        fill(0, 255, 255);
        stroke(0);
        strokeWeight(2);
        rect(x, y, w, h, 7);
        fill(122, 44, 22);
        textSize(15);
        text(opButtonValue, x+15, y+20);
      }
    } else if (isSpecial) {
      fill(0, 255, 255);
      stroke(0);
      strokeWeight(2);
      rect(x, y, w, h, 7);
      fill(122, 44, 22);
      textSize(15);
      text(spButtonValue, x+15, y+20);
    }
  }

  //Handle mouse actions
  void click() {
    on = mouseX < x+w && mouseX > x && mouseY < y+h && mouseY > y;
  }
}


