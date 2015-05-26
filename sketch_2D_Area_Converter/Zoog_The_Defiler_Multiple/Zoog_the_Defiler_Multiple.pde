void setup() {
  // Set the size of the window
  size(800, 800);
}

void draw() {
  // Draw a white background
  background(0);
  
  // Royal Carpet
  fill(168, 40, 252);
  quad(350, 475, 450, 475, 800, 800, 0, 800);
  
  // Gold Footrest
  stroke(0);
  fill(245, 245, 0 );
  rect(400, 475, 140, 60);
  
  //

  // Gold Backboard
  stroke(0);
  fill(245, 245, 0);
  rect(400, 400, 90, 140, 15, 15, 0, 0);

  // Royal Red Backboard
  stroke(0);
  fill(180, 5, 5);
  rect(400, 400, 70, 120, 15, 15, 0, 0);

  // Royal Red Seat
  rect(400, 465, 100, 30, 7, 7, 7, 7);

  // Set CENTER mode
  ellipseMode (CENTER);
  rectMode(CENTER);
  
  zoogFollowers(550, 550);
  zoogFollowers(150, 650);
  zoogFollowers(650, 650);
  zoogFollowers(250, 550);
  zoogDefiler(mouseX, mouseY);
}

void zoogFollowers(int xpos, int ypos) {
  // Draw Zoog's body
  stroke(0);
  fill(255, 0, 255);
  rect(xpos, ypos, 20, 100);

  // Draw Zoog's head
  stroke(0);
  fill(0, 255, 0);
  ellipse(xpos, ypos-30, 60, 60);

  // Draw Zoog's eyes
  fill(0);
  ellipse(xpos-19, ypos-30, 16, 32);
  ellipse(xpos+19, ypos-30, 16, 32);

  // Draw Zoog's legs
  stroke(0, 255, 0);
  line(xpos-10, ypos+50, xpos-20, ypos+60);
  line(xpos+10, ypos+50, xpos+20, ypos+60);
}
  
  void zoogDefiler(int xpos, int ypos) {
  // Draw Zoog's body
  stroke(0);
  fill(255, 0, 255);
  rect(xpos, ypos, 20, 100);

  // Draw Zoog's head
  stroke(0);
  fill(0, 255, 0);
  ellipse(xpos, ypos-30, 60, 60);

  // Draw Zoog's eyes
  fill(0);
  ellipse(xpos-19, ypos-30, 16, 32);
  ellipse(xpos+19, ypos-30, 16, 32);

  // Draw Zoog's legs
  stroke(0, 255, 0);
  line(xpos-10, ypos+50, xpos-20, ypos+60);
  line(xpos+10, ypos+50, xpos+20, ypos+60);
  
  // Draw Zoogs's arms
  stroke(0, 255, 0);
  line(xpos-10, ypos+10, xpos-30, ypos);
  line(xpos+10, ypos+10, xpos+30, ypos);
  
  // Draw Zoog's Orb of Eternal Winter
  stroke(13, 0, 255);
  fill(0, 238, 255);
  ellipse(xpos-35, ypos, 25, 25);
  noFill();
  arc(xpos-35, ypos, 23, 23, 0-HALF_PI, HALF_PI);
  arc(xpos-35, ypos, 21, 21, 0, PI);
  arc(xpos-35, ypos, 19, 19, HALF_PI, PI+HALF_PI);
  arc(xpos-35, ypos, 17, 17, PI, TWO_PI);
  arc(xpos-35, ypos, 15, 15, 0-HALF_PI, HALF_PI);
  arc(xpos-35, ypos, 13, 13, 0, PI);
  arc(xpos-35, ypos, 11, 11, HALF_PI, PI+HALF_PI);
  arc(xpos-35, ypos, 9, 9, PI, TWO_PI);
  arc(xpos-35, ypos, 7, 7, 0-HALF_PI, HALF_PI);
  arc(xpos-35, ypos, 5, 5, 0, PI);
  arc(xpos-35, ypos, 3, 3, HALF_PI, PI+HALF_PI);
  arc(xpos-35, ypos, 1, 1, PI, TWO_PI);
  
  // Draw Zoog's Scepter of Decimation
  stroke(0);
  fill(245, 245, 0);
  quad(xpos+20, ypos+25, xpos+25, ypos+35, xpos+55, ypos-30, xpos+45, ypos-35);
}

