int totalBalls = 100;
Ball[] balls = new Ball[totalBalls];
float lineDrawDistance = 200;

void setup() {
  fullScreen();
  
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  //var lineNum = 0;
  background(0);
  for (int i = 0; i < balls.length; i++) {
    balls[i].update();
    balls[i].show();
  }
  
  // Draw lines
  for (int i = 0; i < balls.length; i++) {
    for (int j = i; j < balls.length; j++) {
       if (balls[i].distanceToCircle(balls[j].xPos, balls[j].yPos) < lineDrawDistance) {
         balls[i].drawLine(balls[j].xPos, balls[j].yPos);
         //lineNum++;
       }
    }
  }
  //print(lineNum + "\n");
}



class Ball {
   float xPos;
   float yPos;
   float xVel;
   float yVel;
   float maxSpeed = 2;
   float circleSize = 5;
   float circleRadius = circleSize / 2;
   
   Ball() {
      xPos = random(circleRadius, width);
      yPos = random(circleRadius, height);
      xVel = random(-maxSpeed, maxSpeed);
      yVel = random(-maxSpeed, maxSpeed);
   }
   
   void show() {
     stroke(255, 0, 255, 50);
     fill(50, 0, 255, 50);
     circle(xPos, yPos, circleSize);
   }
   
   void update() {
      xPos += xVel;
      yPos += yVel;
      
      // Bounce on the edge of the screen
      if (xPos > width - circleRadius || xPos < 0 + circleRadius) {
        xVel *= -1; 
      }
      if (yPos > height - circleRadius || yPos < 0 + circleRadius) {
        yVel *= -1; 
      }
   }
   
   void drawLine(float otherX, float otherY) {
      if (dist(xPos, yPos, otherX, otherY) < lineDrawDistance) {
        float alphaStroke = (lineDrawDistance - dist(xPos, yPos, otherX, otherY) / 2 * 2.55);
        stroke(alphaStroke, 0, 255, alphaStroke);
        line(xPos, yPos, otherX, otherY); 
      }
   }
   
   float distanceToCircle(float otherX, float otherY) {
      return dist(xPos, yPos, otherX, otherY);
   }
}
