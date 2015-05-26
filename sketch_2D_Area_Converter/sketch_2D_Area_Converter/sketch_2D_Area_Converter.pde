float xSize = 0;
float ySize = 0;
void setup() {
  size(1000, 1000);
}

void draw() {
  background(0);
  fill(255);
  textSize(32);
  text("Square Foot Area Converter", 300, 50);
  textSize(10);
  drawHorizGridLines();
  drawVertGridLines();
  xSize = mouseX-100;
  ySize = mouseY-100;
  if(xSize>=800)
  {
    xSize=800;
  }
  if(ySize>=800)
  {
    ySize=800;
  }
  if(xSize<=0)
  {
    xSize=0;
  }
  if(ySize<=0)
  {
    ySize=0;
  }
  fill(xSize/4, 0, ySize/4);
  rect(100,100,xSize,ySize);
  fill(255);
  textSize(15);
  text("Square Inch value = " + int((xSize)*(ySize)), 400, 930);
  text("Square Foot value = " + changeToFeet((xSize)*(ySize)), 400, 950);
  
}

void drawHorizGridLines() {
   //set min, set max, set counter
  for(int i = 0; i<801; i+=50) {
    stroke(255);
    line(100, i+100, 900, i+100);
    text(i, 80, i+100);
  }
}

void drawVertGridLines() {
   //set min, set max, set counter
  for(int i = 0; i<801; i+=50) {
    stroke(255);
    line(i+100, 100, i+100, 900);
    text(i, i+98, 95);
  }
}

float changeToFeet(float value) {
  value = (xSize*ySize)/144;
  return value;
}



