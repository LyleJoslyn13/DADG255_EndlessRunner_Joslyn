class Grenade extends AABB {
  
  float fuseTime = 3;
  float bounceHeight = 300;
  float mappedAngle;
 
  Grenade(float xPos, float yPos, float angle) {
    position.x = xPos;
    position.y = yPos;
    
    launchAngle = angle;
    velocity.x = 300;
    velocity.y = -300;
    setSize(15, 15);
  }
  
  void update() {
    
    fuseTime -= dt;
    
    mappedAngle = map(fuseTime, 3, 0, -radians(90), radians(270));
    
    velocity.y += GRAVITY * dt;
    
    position.x += velocity.x * cos(launchAngle) * dt;
    position.y += velocity.y * dt;
    
    if(fuseTime <= 0) {
                              // EXPLOSION //
       applyDamageToEnemies();                       
       isDead = true;
    }
    
    if(position.y >= height - 100 - halfH) {     // collision with ground //
       bounce(height - 100 - halfH);
    }
    
    if(position.x > width + halfW || position.x < -halfW || position.y > height + halfH) isDead = true;
    
    super.update();
  }
  
  void draw() {
    fill(#1a8107);
    ellipse(position.x, position.y, w, h);
    
    fill(255);
    ellipse(position.x, position.y - h - 10, 10, 10);
    fill(60, 128);
    arc(position.x, position.y - h - 10, 10, 10, -radians(90), mappedAngle);
  }
  
  void bounce(float yPos) {
   position.y = yPos;
   velocity.y = -bounceHeight;
   bounceHeight /= 2;
   velocity.x *= 0.5;
  }
  
  @Override void fixOverlap(AABB other) {
   float pushUp = edgeB - other.edgeT;
   float pushLeft = edgeR - other.edgeL;
      
   if(pushUp <= pushLeft) bounce(other.edgeT - halfH); 
   else {
     position.x -= halfW;
     velocity.x *= -1;
   }
  }
  
  void applyDamageToEnemies() {
   for(int i = 0; i< enemies.size(); i++) {
    float dis = dist(position.x, position.y, enemies.get(i).position.x, enemies.get(i).position.y);
    if(dis <= 200) {
     enemies.get(i).damagePool += 50;
    }
   }
  }
  
}
