// Endless Runner
// Copyright Lyle Joslyn 2024
// Controls

float dt, prevTime = 0;

final float GRAVITY = 981;

Player player;

void setup() {
  size(800, 600);
  noStroke();
  player = new Player();
}

void draw() {
  calcDeltaTime();
  background(128);
 
  player.update();
  
  fill(#FFB56F);
  rect(0, height-100, width, 150);
  player.draw();

// Prep for next frame //
  Keyboard.update();
  Mouse.update();
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}

void mousePressed() {
  if(mouseButton == LEFT) Mouse.handleKeyDown(Mouse.LEFT);
  if(mouseButton == RIGHT) Mouse.handleKeyDown(Mouse.RIGHT);
  if(mouseButton == CENTER) Mouse.handleKeyDown(Mouse.CENTER);
}

void mouseReleased() {
  if(mouseButton == LEFT) Mouse.handleKeyUp(Mouse.LEFT);
  if(mouseButton == RIGHT) Mouse.handleKeyUp(Mouse.RIGHT);
  if(mouseButton == CENTER) Mouse.handleKeyUp(Mouse.CENTER);
}

void calcDeltaTime(){
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}
