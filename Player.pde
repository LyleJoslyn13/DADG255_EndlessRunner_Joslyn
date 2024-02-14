class Player extends AABB{
  
  float maxHealth = 100, currentHealth = maxHealth;
  boolean isGrounded = false;
  int numJumps = 2;
  
  // MAKE DOUBLE JUMPS BY MONDAY //
  
  Player() {
    position = new PVector(75, height/2);
    velocity = new PVector();
    setSize(50, 50); // THIS FUNCTION MUST BE CALLED FOR ALL AABB OBJECTS!!!! //
  }
  
  void update() {
   
    velocity.y += GRAVITY * dt;
   // velocity.x += GRAVITY * dt;
    
    if(Keyboard.onDown(Keyboard.SPACE)) {
     velocity.y = -500; 
    }
    
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    
    if(position.y >= height - 100 - halfH) {
     position.y = height - 100 - halfH;
     velocity.y = 0;
     isGrounded = true;
    }
    
    super.update();
  }
  
  void draw() {
   fill(#1AB4FF);
   rect(position.x -halfW, position.y - halfH, w, h);
  }
  
}
