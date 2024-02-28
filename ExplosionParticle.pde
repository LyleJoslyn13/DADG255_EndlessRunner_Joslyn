class ExplosionParticle extends Particle {
 
  float initialX, initialY;
  
  ExplosionParticle(float xPos, float yPos) {
    super();
    initialX = xPos;
    initialY = yPos;
    position.x = xPos;
    position.y = yPos;
    angle = random(radians(360));
    velocity.x = cos(angle) * random(GameManager.grenadeExplosionRadius - GameManager.grenadeExplosionRadius / 2,GameManager.grenadeExplosionRadius);
    velocity.y = sin(angle) * random(GameManager.grenadeExplosionRadius - GameManager.grenadeExplosionRadius / 2,GameManager.grenadeExplosionRadius);
    
    size = random(5, 10);
    alpha = random(128, 255);
    rotateAngle = random(radians(360));
    rotateSpeed = random(radians(500), radians(720));
    
    r = g = b = random(100);
    lifeTime = 5;
  }
  
  void update() {
    
   // velocity.y += GRAVITY * dt;
    
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    
    velocity.x *= 1.03;
    velocity.y *= 1.03;
    
    //if(position.x >= initialX + GameManager.grenadeExplosionRadius * cos(angle)) {
    // position.x = initialX + GameManager.grenadeExplosionRadius * cos(angle);
    //}
    
    //if(position.y >= initialY + GameManager.grenadeExplosionRadius * sin(angle)) {
    // position.y = initialY + GameManager.grenadeExplosionRadius * sin(angle);
    //}
    
    rotateAngle += rotateSpeed * dt;
    
    lifeTime -= dt;
    
    size -= 10 * dt;
    if(size <= 0) isDead = true;
    
    alpha -= dt;
    
    
    super.update();
  }
  
  void draw() {
    fill(r, g, b, alpha);
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotateAngle);
    rect(-size/2, -size/2, size, size);
    popMatrix();
  }
  
}
