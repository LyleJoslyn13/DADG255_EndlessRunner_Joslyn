class Player extends AABB{
  
  float maxHealth = 100, currentHealth = maxHealth;
  boolean isGrounded = false;
  boolean isGroundPound = false;
  boolean isRumble = false;
  float rumbleTime = 0.3;
  float rumbleMultiplier = 4;
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
   
   if(isGrounded == false) { // GROUND POUND FUNCTIONALITY //
   
     if(Keyboard.onDown(Keyboard.DOWN)) { 
       isGroundPound = true;
       velocity.y = 1500;
     }
   }
   
   if(isRumble) {
    rumbleTime -= dt;
    float randX = random(-1, 1) * rumbleMultiplier;
    float randY = random(-1, 1) * rumbleMultiplier;
    
    translate(randX, randY);
    
    if(rumbleTime <=0) {
      translate(0, 0 );
      isRumble = false;
      rumbleTime = 0.3;
    }
   }
   
    if(numJumps < 2){
    if(Keyboard.onDown(Keyboard.SPACE)) {
     velocity.y = -500;
     numJumps++;
     isGrounded = false;
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
    
    if(isGrounded) {
     if(velocity.x > 50 || velocity.x < -50) {
       SkidParticle s = new SkidParticle(random(position.x - halfW, position.x + halfW), position.y + halfH, velocity.x > 0 ? 1 : -1);
       particles.add(s);
     }
    }
    
    if(position.y >= height - 100 - halfH) {
     position.y = height - 100 - halfH;
     velocity.y = 0;
     isGrounded = true;
     friction = 0.95;
     rumble();
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
  
  @Override void setBottomEdge(float Y) {
      position.y = Y - halfH;
      velocity.y = 0;
      isGrounded = true;
      rumble();
      calcEdges();
    }
  
  void rumble() {
  if(isGroundPound) {
       //Screen shake
       isRumble = true;
       //Apply Damage
       //Spawn Particles
       isGroundPound = false;
     }
  } 
}
