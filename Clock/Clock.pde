int angleToCenter = 30;
int angleToTextCorner = 60;

void setup()
{
  size(400, 400);
}

void drawDigits()
{
    pushMatrix();
  rotate(-radians(90));
  
  for (int i = 1; i < 13; i++) 
  {
    pushMatrix();
    println("Angle to center: " + angleToCenter);
    rotate(radians(angleToCenter));
    
    pushMatrix();
    translate(100, 0);
    println("Angle to text corner: " + angleToTextCorner);
    
    rotate(radians(angleToTextCorner));
     String num = str(i);
    //float textHeight = 32.0;
    //textSize(textHeight);
    float textWidth = textWidth(num);
    //translate(-textWidth/2, -textHeight/2);
    //point(-textWidth/2, -textHeight/2);
    textSize(32);
    translate(-textWidth/2, 10);
    fill(42, 2, 56);
    text(str(i), 0, 0);
    popMatrix();
    popMatrix();
    angleToCenter += 30;
    angleToTextCorner -= 30;
  }
  popMatrix();
}

void drawClockHands()
{
    pushMatrix();
  rotate(-HALF_PI);
  
  int hr = hour();
  int mn = minute();
  int sc = second();

  strokeWeight(8);
  stroke(255, 100, 150);
  noFill();
  float secondAngle = map(sc, 0, 60, 0, TWO_PI);
  arc(0, 0, 300, 300, 0, secondAngle);

  stroke(150, 100, 255);
  float minuteAngle = map(mn, 0, 60, 0, TWO_PI);
  arc(0, 0, 280, 280, 0, minuteAngle);

  stroke(150, 255, 100);
  float hourAngle = map(hr % 12, 0, 12, 0, TWO_PI);
  arc(0, 0, 260, 260, 0, hourAngle);

  pushMatrix();
  rotate(secondAngle);
  stroke(255, 100, 150);
  line(0, 0, 100, 0);
  popMatrix();

  pushMatrix();
  rotate(minuteAngle);
  stroke(150, 100, 255);
  line(0, 0, 75, 0);
  popMatrix();

  pushMatrix();
  rotate(hourAngle);
  stroke(45, 78, 0);
  line(0, 0, 50, 0);
  popMatrix();

  stroke(255);
  point(0, 0);
  
  popMatrix();
}

void draw() {
  background(244, 251, 167);
  translate(200, 200);
  
  drawDigits();
  drawClockHands();


 }
