float pitch = 0;
float yaw = 0;
float roll = 0;
float scale = 1; // Variabel untuk menyimpan skala
float projX = 0; // Variabel untuk menyimpan posisi proyeksi X
float projY = 0; // Variabel untuk menyimpan posisi proyeksi Y
boolean wPressed, sPressed, aPressed, dPressed, ltPressed, gtPressed, plusPressed, minusPressed, upPressed, downPressed, leftPressed, rightPressed, mirrorPressed;
boolean mirrored = false; // Variabel untuk menyimpan status mirror
PShape arrShape;

void setup() {
  size(1200, 1000, P3D);
  arrShape = createShape(GROUP);

  // Huruf A
  PShape aShape = createShape(GROUP);
  PShape aLeft = createBox(100, 500, 100);
  PShape aRight = createBox(100, 500, 100);
  PShape aMiddle = createBox(200, 100, 100);
  PShape aMiddleHorizontal = createBox(200, 100, 100);
  aLeft.translate(-150, 0, 0);
  aRight.translate(150, 0, 0);
  aMiddle.translate(0, -200, 0);
  aMiddleHorizontal.translate(0, 0, 0);
  aShape.addChild(aLeft);
  aShape.addChild(aRight);
  aShape.addChild(aMiddle);
  aShape.addChild(aMiddleHorizontal);

  // Huruf R pertama
  PShape rShape = createShape(GROUP);
  PShape rVertical = createBox(100, 500, 100);
  PShape rTop = createBox(100, 100, 100);
  PShape rRight = createBox(100, 300, 100);
  PShape rMiddle = createBox(100, 100, 100);
  PShape rDiagonal = createBox(245, 100, 100);
  rVertical.translate(-50, 0, 0);
  rTop.translate(50, -200, 0);
  rRight.translate(150, -100, 0);
  rMiddle.translate(50, 0, 0);
  rDiagonal.translate(120, 70, 0);
  rDiagonal.rotateZ(radians(45));
  rShape.addChild(rVertical);
  rShape.addChild(rTop);
  rShape.addChild(rRight);
  rShape.addChild(rMiddle);
  rShape.addChild(rDiagonal);

  // Huruf R kedua
  PShape rShape2 = createShape(GROUP);
  PShape rVertical2 = createBox(100, 500, 100);
  PShape rTop2 = createBox(100, 100, 100);
  PShape rRight2 = createBox(100, 300, 100);
  PShape rMiddle2 = createBox(100, 100, 100);
  PShape rDiagonal2 = createBox(245, 100, 100);
  rVertical2.translate(-50, 0, 0);
  rTop2.translate(50, -200, 0);
  rRight2.translate(150, -100, 0);
  rMiddle2.translate(50, 0, 0);
  rDiagonal2.translate(120, 70, 0);
  rDiagonal2.rotateZ(radians(45));
  rShape2.addChild(rVertical2);
  rShape2.addChild(rTop2);
  rShape2.addChild(rRight2);
  rShape2.addChild(rMiddle2);
  rShape2.addChild(rDiagonal2);

  // Group all letters into one shape
  arrShape.addChild(aShape);
  arrShape.addChild(rShape);
  arrShape.addChild(rShape2);

  // Translate each letter to appropriate positions
  aShape.translate(-450, 0, 0); // -1.5 * spacing
  rShape.translate(0, 0, 0); // 0 * spacing
  rShape2.translate(450, 0, 0);  // 1.5 * spacing
}

void draw() {
  background(255);
  lights(); // Enable lighting

  if (upPressed) {
    projY -= 10;
  }
  if (downPressed) {
    projY += 10;
  }
  if (leftPressed) {
    projX -= 10;
  }
  if (rightPressed) {
    projX += 10;
  }

  if (mirrorPressed) {
    mirrored = !mirrored;
    mirrorPressed = false;
  }

  translate(width / 2 + projX, height / 2 + projY, 0); // Center and move the group shape

  if (wPressed) {
    pitch -= radians(1);
  }
  if (sPressed) {
    pitch += radians(1);
  }
  if (aPressed) {
    yaw -= radians(1);
  }
  if (dPressed) {
    yaw += radians(1);
  }
  if (ltPressed) {
    roll -= radians(1);
  }
  if (gtPressed) {
    roll += radians(1);
  }
  if (plusPressed) {
    scale += 0.01;
  }
  if (minusPressed) {
    scale -= 0.01;
  }

  pitch = pitch % TWO_PI;
  yaw = yaw % TWO_PI;
  roll = roll % TWO_PI;

  scale = constrain(scale, 0.1, 10); // Batasi skala antara 0.1 dan 10

  if (mirrored) {
    scale(-1, 1, 1); // Mirror the shape
  }

  rotateX(pitch);
  rotateY(yaw);
  rotateZ(roll);
  scale(scale); // Terapkan skala

  shape(arrShape);
}

void keyPressed() {
  if (key == 'w') {
    wPressed = true;
  }
  if (key == 's') {
    sPressed = true;
  }
  if (key == 'a') {
    aPressed = true;
  }
  if (key == 'd') {
    dPressed = true;
  }
  if (key == '<') {
    ltPressed = true;
  }
  if (key == '>') {
    gtPressed = true;
  }
  if (key == '+') {
    plusPressed = true;
  }
  if (key == '-') {
    minusPressed = true;
  }
  if (keyCode == UP) {
    upPressed = true;
  }
  if (keyCode == DOWN) {
    downPressed = true;
  }
  if (keyCode == LEFT) {
    leftPressed = true;
  }
  if (keyCode == RIGHT) {
    rightPressed = true;
  }
  if (key == 'm' || key == 'M') {
    mirrorPressed = true;
  }
}

void keyReleased() {
  if (key == 'w') {
    wPressed = false;
  }
  if (key == 's') {
    sPressed = false;
  }
  if (key == 'a') {
    aPressed = false;
  }
  if (key == 'd') {
    dPressed = false;
  }
  if (key == '<') {
    ltPressed = false;
  }
  if (key == '>') {
    gtPressed = false;
  }
  if (key == '+') {
    plusPressed = false;
  }
  if (key == '-') {
    minusPressed = false;
  }
  if (keyCode == UP) {
    upPressed = false;
  }
  if (keyCode == DOWN) {
    downPressed = false;
  }
  if (keyCode == LEFT) {
    leftPressed = false;
  }
  if (keyCode == RIGHT) {
    rightPressed = false;
  }
}

PShape createBox(float w, float h, float d) {
  PShape box = createShape(BOX, w, h, d);
  box.setFill(color(255, 0, 0)); // Single color for all shapes
  return box;
}
