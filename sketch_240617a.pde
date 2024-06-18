PShape arr;
float angle = 0;
float scaleFactor = 1;
boolean mirror = false;
int posX = 75, posY = 250;

boolean moveUp, moveDown, moveLeft, moveRight;
boolean rotateClockwise, rotateCounterClockwise;
boolean scaleUp, scaleDown;
boolean flipHorizontal;

void setup(){
  size(1000, 1000, P2D);
  
  // ARR
  arr = createShape(GROUP);
  
  // Warna untuk huruf-huruf (misalnya warna hijau)
  int letterColor = color(0, 255, 0);
  
  // Huruf A
  PShape a1 = createShape(RECT, 100, 200, 50, 300);
  PShape a2 = createShape(RECT, 150, 320, 100, 50);
  PShape a3 = createShape(RECT, 250, 200, 50, 300);
  PShape a4 = createShape(RECT, 150, 200, 100, 50);
  a1.setFill(letterColor);
  a2.setFill(letterColor);
  a3.setFill(letterColor);
  a4.setFill(letterColor);
  
  // Huruf R pertama
  PShape r1 = createShape(RECT, 350, 200, 50, 300);
  PShape r2 = createShape(RECT, 400, 200, 50, 45);
  PShape r3 = createShape(RECT, 400, 325, 50, 45);
  PShape circ1 = createShape(ARC, 450, 285, 170, 170, PI + HALF_PI, TWO_PI + HALF_PI);
  PShape circ2 = createShape(ARC, 445, 285, 80, 80, PI + HALF_PI, TWO_PI + HALF_PI);
  PShape par = createShape();
  par.beginShape();
  par.vertex(400, 370);
  par.vertex(460, 370);
  par.vertex(560, 500);
  par.vertex(500, 500);
  par.endShape(CLOSE);
  
  r1.setFill(letterColor);
  r2.setFill(letterColor);
  r3.setFill(letterColor);
  circ1.setFill(letterColor);
  circ2.setFill(color(220));  // Lingkaran dalam tetap abu-abu untuk menampilkan "lubang"
  par.setFill(letterColor);
  
  // Huruf R kedua
  PShape r4 = createShape(RECT, 600, 200, 50, 300);
  PShape r5 = createShape(RECT, 650, 200, 50, 45);
  PShape r6 = createShape(RECT, 650, 325, 50, 45);
  PShape circ3 = createShape(ARC, 700, 285, 170, 170, PI + HALF_PI, TWO_PI + HALF_PI);
  PShape circ4 = createShape(ARC, 695, 285, 80, 80, PI + HALF_PI, TWO_PI + HALF_PI);
  PShape par2 = createShape();
  par2.beginShape();
  par2.vertex(650, 370);
  par2.vertex(710, 370);
  par2.vertex(810, 500);
  par2.vertex(750, 500);
  par2.endShape(CLOSE);
  
  r4.setFill(letterColor);
  r5.setFill(letterColor);
  r6.setFill(letterColor);
  circ3.setFill(letterColor);
  circ4.setFill(color(220));  // Lingkaran dalam tetap abu-abu untuk menampilkan "lubang"
  par2.setFill(letterColor);
  
  // Add shapes to the group
  arr.addChild(a1);
  arr.addChild(a2);
  arr.addChild(a3);
  arr.addChild(a4);
  arr.addChild(r1);
  arr.addChild(r2);
  arr.addChild(r3);
  arr.addChild(circ1);
  arr.addChild(circ2);
  arr.addChild(par);
  arr.addChild(r4);
  arr.addChild(r5);
  arr.addChild(r6);
  arr.addChild(circ3);
  arr.addChild(circ4);
  arr.addChild(par2);
}

void draw(){
 noStroke();
 background(220);
 translate(posX, posY);
 if (mirror) scale(-1, 1);
 scale(scaleFactor);
 rotate(angle);
 shape(arr);
 
  if (moveUp) {
    posY -= 5;
  }
  if (moveDown) {
    posY += 5;
  }
  if (moveLeft) {
    posX -= 5;
  }
  if (moveRight) {
    posX += 5;
  }
  if (rotateClockwise) {
    angle += 0.1;
  }
  if (rotateCounterClockwise) {
    angle -= 0.1;
  }
  if (scaleUp) {
    scaleFactor += 0.01;
  }
  if (scaleDown) {
    scaleFactor -= 0.01;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) moveUp = true;
    if (keyCode == DOWN) moveDown = true;
    if (keyCode == LEFT) moveLeft = true;
    if (keyCode == RIGHT) moveRight = true;
  } else {
    if (key == 'q') rotateCounterClockwise = true;
    if (key == 'e') rotateClockwise = true;
    if (key == ']') scaleUp = true;
    if (key == '[') scaleDown = true;
    if (key == 'm') flipHorizontal = true;
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) moveUp = false;
    if (keyCode == DOWN) moveDown = false;
    if (keyCode == LEFT) moveLeft = false;
    if (keyCode == RIGHT) moveRight = false;
  } else {
    if (key == 'q') rotateCounterClockwise = false;
    if (key == 'e') rotateClockwise = false;
    if (key == ']') scaleUp = false;
    if (key == '[') scaleDown = false;
    if (key == 'm') {
      flipHorizontal = false;
      mirror = !mirror;
    }
  }
}
