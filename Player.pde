class Player extends AABB{
  
  float maxHealth = 100, currentHealth = maxHealth;
  boolean isGrounded = false;
  int numJumps = 2;
  
  float friction = 0.95;
  
  // MAKE DOUBLE JUMPS BY MONDAY //
  
  Player() {
    position = new PVector(75, height/2);
    velocity = new PVector();
    setSize(50, 50); // THIS FUNCTION MUST BE CALLED FOR ALL AABB OBJECTS!!!! //
  }
  
  void update() {
   
    calcAngleToMouse();
    
    velocity.y += GRAVITY * dt;
   // velocity.x += GRAVITY * dt;
    if(numJumps < 2){
    if(Keyboard.onDown(Keyboard.SPACE)) {
     velocity.y = -500;
     numJumps++;
     //println(numJumps);
    }
    }
    
    if(Keyboard.isDown(Keyboard.LEFT)) {
      velocity.x = -300;
    }
    else if(Keyboard.isDown(Keyboard.RIGHT)) {
      velocity.x = 300;
    }
    else {
     // if(isGrounded)
     //velocity.x = 0;
    }
    
    velocity.x *= friction;    // Applys easing on player //
    
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    
    if(position.y >= height - 100 - halfH) {
     position.y = height - 100 - halfH;
     velocity.y = 0;
     isGrounded = true;
     friction = 0.95;
    }
    
    if(position.y < height - 100 - halfH){
      isGrounded = false;
    }
    
    if(isGrounded == true){
      numJumps = 0;
      //println("reset");
    }
    
    super.update();
  }
  
  void draw() {
   fill(#1AB4FF);
   rect(position.x -halfW, position.y - halfH, w, h);
   fill(255);
   float reticleX = position.x + 75 * cos(angleToMouse);
   float reticleY = position.y + 75 * sin(angleToMouse);
   ellipse(reticleX, reticleY, 5, 5);
  }
  
}
