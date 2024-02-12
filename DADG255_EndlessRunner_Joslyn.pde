// Endless Runner
// Copyright Lyle Joslyn 2024
// Controls

void setup() {
  size(800, 600);
}

void draw() {

 

// Prep for next frame //
  Keyboard.update();
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}
