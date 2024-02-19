class Platform extends AABB{
 
  Platform(float X, float Y, float W, float H){
    position.x = X;
    position.y = Y;
    
    setSize(W, H);
    velocity.x = -200;
  }
  
  void update() {
    
    position.x += velocity.x * dt;
    
    if(position.x < -halfW) isDead = true;
    super.update();
  }
  
  void draw() {
    fill(60);
    rect(position.x - halfW, position.y - halfH, w, h);
  }
}
