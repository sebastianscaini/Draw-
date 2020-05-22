//Booleans for keeping track of what's happened
boolean leftShot = false, rightShot = false, displayDrawn = false, doneSand = false;

//floats related to bullets
float bulletSpeed = 10;
float leftBulletX = 120, leftBulletY = 275;
float rightBulletX = 260, rightBulletY= 275;

//make random time
float randomTime = random(1000, 15000);

//cloud variables
float cloudUnoX = -50, cloudUnoY = random(0, 260), cloudUnoSpeed = random(0.1, 1);
float cloudDosX = 450, cloudDosY = random(0, 260), cloudDosSpeed = random(0.1, 1);

void setup() {
  surface.setTitle("Duel!");
  surface.setIcon(loadImage("Icon.png"));
  frameRate(60);
  size(400, 400);
  rectMode(CORNERS);
  ellipseMode(CORNERS);
}

void draw() {

  //draw everything
  background(#6ed1ff);
  drawSun();
  drawSand();
  drawCloudUno();
  drawCloudDos();
  drawMountains();
  drawCactus();

  //when the time has passed, draw the display 
  if (millis() >= randomTime) {
    drawDisplay();
  }

  //draw both characters
  drawCharacterLeft();
  drawCharacterRight();

  //draw bullet when players shoot
  if (leftShot) {
    drawLeftBullet();
    updateLeftBullet();
  }
  if (rightShot) {
    drawRightBullet();
    updateRightBullet();
  }
}

//draw sand
void drawSand() {
  fill(#ffd083);
  stroke(0);
  rect(0, 300, 400, 400);
  
  //loop drawing points to add grainy texture
  for (int sandX = 0; sandX <= 400; sandX += 10){
    for (int sandY = 300; sandY < 400; sandY += 5){
       fill(#d69159);
       point(sandX, sandY);
    }
  }
}

//draw "Draw!"
void drawDisplay() {
  stroke(#AA0F00);
  fill(#AA0F00);
  strokeWeight(2);
  
  //D
  line(150, 140, 150, 170);
  line(150, 140, 160, 155);
  line(160, 155, 150, 170);
  
  //R
  line(170, 140, 170, 170);
  line(170, 140, 180, 150);
  line(170, 160, 180, 150);
  line(170, 160, 180, 170);
  
  //A
  line(190, 170, 200, 140);
  line(200, 140, 210, 170);
  line(195, 155, 205, 155);
  
  //W
  line(220, 140, 225, 170);
  line(225, 170, 230, 160);
  line(230, 160, 235, 170);
  line(235, 170, 240, 140);
  
  //display has been drawn
  displayDrawn = true;
  
  strokeWeight(1);
}

//draw mountains
void drawMountains() {
  fill(#888888);
  stroke(0);
  triangle(150, 300, 270, 150, 350, 300);
  triangle(270, 300, 340, 170, 400, 300);
  triangle(190, 300, 300, 160, 360, 300);
}

//draw cactus
void drawCactus() {
  fill(#0d9d00);
  stroke(0);
  rect(110, 190, 140, 310, 20, 20, 0, 0);
  rect(90, 200, 110, 250, 20, 20, 0, 20);
  rect(140, 210, 160, 260, 20, 20, 20, 0);
}

//draw cloud 1
void drawCloudUno() {

  //reset when leave screen with new Y coordinate
  if (cloudUnoX >= 450) {
    cloudUnoY = random(0, 260);
    cloudUnoSpeed = random(0.1, 1);
    cloudUnoX = -50;
  }
  //make cloud
  fill(255);
  noStroke();
  ellipse(cloudUnoX, cloudUnoY, cloudUnoX + 25, cloudUnoY - 25);
  ellipse(cloudUnoX + 15, cloudUnoY + 10, cloudUnoX + 40, cloudUnoY - 25);
  ellipse(cloudUnoX - 15, cloudUnoY, cloudUnoX + 10, cloudUnoY -25);
  ellipse(cloudUnoX - 10, cloudUnoY + 15, cloudUnoX + 15, cloudUnoY - 10);
  ellipse(cloudUnoX - 10, cloudUnoY - 30, cloudUnoX + 15, cloudUnoY - 5);
  ellipse(cloudUnoX + 10, cloudUnoY - 30, cloudUnoX + 35, cloudUnoY - 5);
  ellipse(cloudUnoX + 20, cloudUnoY, cloudUnoX - 5, cloudUnoY - 25);
  ellipse(cloudUnoX + 35, cloudUnoY - 20, cloudUnoX + 10, cloudUnoY + 5);
  ellipse(cloudUnoX + 10, cloudUnoY + 15, cloudUnoX + 35, cloudUnoY - 10);
  
  //move cloud
  cloudUnoX += cloudUnoSpeed;
}

//draw cloud 2
void drawCloudDos(){
  
  //reset when leave screen with new Y coordinate
  if (cloudDosX <= -50) {
    cloudDosY = random(0, 260);
    cloudDosSpeed = random(0.1, 1);
    cloudDosX = 450;
  }
  //make cloud
  fill(255);
  noStroke();
  ellipse(cloudDosX, cloudDosY, cloudDosX + 25, cloudDosY - 25);
  ellipse(cloudDosX + 15, cloudDosY + 10, cloudDosX + 40, cloudDosY - 25);
  ellipse(cloudDosX - 15, cloudDosY, cloudDosX + 10, cloudDosY -25);
  ellipse(cloudDosX - 10, cloudDosY + 15, cloudDosX + 15, cloudDosY - 10);
  ellipse(cloudDosX - 10, cloudDosY - 30, cloudDosX + 15, cloudDosY - 5);
  ellipse(cloudDosX + 10, cloudDosY - 30, cloudDosX + 35, cloudDosY - 5);
  ellipse(cloudDosX + 20, cloudDosY, cloudDosX - 5, cloudDosY - 25);
  ellipse(cloudDosX + 35, cloudDosY - 20, cloudDosX + 10, cloudDosY + 5);
  ellipse(cloudDosX + 10, cloudDosY + 15, cloudDosX + 35, cloudDosY - 10);
  
  //move cloud
  cloudDosX -= cloudDosSpeed; 
}

//draw sun

void drawSun(){
  fill(#fffd7a, 90);
  noStroke();
  ellipse(mouseX - 20, mouseY - 20, mouseX + 70, mouseY + 70);
  
  fill(#fffd7a);
  stroke(0);
  ellipse(mouseX, mouseY, mouseX + 50, mouseY + 50);
}

//draw the character on the left
void drawCharacterLeft() {

  //shirt
  fill(#a6824c);
  stroke(0);
  rect(40, 260, 60, 310);

  //pants
  fill(#8a5300);
  stroke(0);
  rect(40, 310, 60, 360);

  //shoes
  fill(#100d08);
  stroke(0);
  rect(40, 360, 70, 370);

  //before player shoots
  if (!leftShot) {
    //arm
    fill(#a6824c);
    stroke(0);
    rect(45, 280, 55, 320);

    //gun
    fill(#d2d2d2);
    stroke(0);
    rect(45, 325, 60, 332.5);
    rect(60, 325, 70, 350);

    //hand
    fill(#ffe4bc);
    stroke(0);
    ellipse(43.5, 315, 57.5, 330);
  }
  //when player shoots
  else if (leftShot) {
    //arm
    fill(#a6824c);
    stroke(0);
    rect(45, 280, 85, 290);

    //gun
    fill(#d2d2d2);
    stroke(0);
    rect(95, 285, 102.5, 300);
    rect(95, 285, 120, 275);

    //hand
    fill(#ffe4bc);
    stroke(0);
    ellipse(83.5, 278.5, 98.5, 292.5);
  }

  //HEAD
  //nose
  fill(#ffe4bc);
  stroke(0);
  triangle(68, 240, 78, 255, 68, 260);

  //hat piece
  fill(#8a5401);
  ellipse(35, 210, 65, 250);

  //head
  fill(#ffe4bc);
  ellipse(30, 230, 70, 270);

  //eye
  fill(0);
  ellipse(60, 245, 65, 250);

  //mouth
  line(65, 263, 55, 263);

  //hat brim
  fill(#8a5401);
  rect(25, 230, 75, 235);
}

//draw the character on the right
void drawCharacterRight() {
  
  //shirt
  fill(#a6824c);
  stroke(0);
  rect(320, 260, 340, 310);
  
  //pants
  fill(#8a5300);
  stroke(0);
  rect(320, 310, 340, 360);
  
  //shoes
  fill(0);
  stroke(0);
  rect(310, 360, 340, 370);
  
  //before shooting
  if (!rightShot){
    //arm
    fill(#a6824c);
    stroke(0);
    rect(325, 280, 335, 330);

    //gun
    fill(#d2d2d2);
    stroke(0);
    rect(335, 325, 315, 332.5);
    rect(325, 325, 315, 350);

    //hand
    fill(#ffe4bc);
    stroke(0);
    ellipse(323.5, 315, 338.5, 330);
  }
  //when right player has shot
  else if (rightShot) {
    //arm
    fill(#a6824c);
    stroke(0);
    rect(335, 280, 285, 290);

    //gun
    fill(#d2d2d2);
    stroke(0);
    rect(285, 285, 278.5, 300);
    rect(285, 285, 260, 275);

    //hand
    fill(#ffe4bc);
    stroke(0);
    ellipse(283.5, 278.5, 297.5, 292.5);
  }
  
  //HEAD
  //nose
  fill(#ffe4bc);
  stroke(0);
  triangle(312, 240, 300, 255, 312, 260);

  //hat piece
  fill(#8a5401);
  ellipse(315, 215, 345, 255);

  //head
  fill(#ffe4bc);
  ellipse(310, 230, 350, 270);

  //eye
  fill(0);
  ellipse(320, 245, 325, 250);

  //mouth
  line(325, 263, 315, 263);

  //hat brim
  fill(#8a5401);
  rect(305, 230, 355, 235); 
  
}

//draw left player's bullet
void drawLeftBullet() {
  noStroke();
  fill(0);
  rect(leftBulletX, leftBulletY, leftBulletX + 5, leftBulletY + 5, 0, 20, 0, 20);
}

//draw right player's bullet
void drawRightBullet() {
  noStroke();
  fill(0);
  rect(rightBulletX, rightBulletY, rightBulletX - 5, rightBulletY + 5, 20, 0, 20, 0);
}

//move left player's bullet and check if it hits the other player first
void updateLeftBullet() {
  if (leftBulletX < 320) {
    leftBulletX += bulletSpeed;
  } else if (leftBulletX == 320 && displayDrawn) {
    println("1P Win!");
    frameRate(0);
  } else if (leftBulletX == 320 && !displayDrawn) {
    println("2P Win by default!");
    frameRate(0);
  }
}

//move right player's bullet and check if it hits the other player first
void updateRightBullet() {
  if (rightBulletX > 60) {
    rightBulletX -= bulletSpeed;
  } else if (rightBulletX == 80 && displayDrawn) {
    println("2P Win!");
    frameRate(0);
  } else if (rightBulletX == 80 && !displayDrawn) {
    println("1P Win by default!");
    frameRate(0);
  }
}

void keyPressed() {

  //when Z is pressed shoot left player's bullet
  if (key == 'z' && !leftShot) {
    leftShot = true;
  }

  //when M is pressed shoot right player's bullet
  if (key == 'm' && !rightShot) {
    rightShot = true;
  }
}
