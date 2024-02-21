class SkidParticle extends Particle {
 
  SkidParticle(float xPos, float yPos, float direction) { 
    super();
    position.x = xPos;
    position.y = yPos;
    
    lifeTime = 5;
    size = random(3, 6);
    alpha = random(128, 255);
    velocity.x = random(50, 150) * direction;
    velocity.y = random(-100, -50);
    rotateAngle = random(radians(360));
    rotateSpeed = random(radians(30), radians(720)) * direction;
    r = 27;
    g = 90;
    b = random(100); 
  }
  
  void update() {
    
   velocity.y += GRAVITY * dt;
   
   alpha -= 355 * dt; 
   rotateAngle += rotateSpeed * dt;
   
   position.x += velocity.x * dt;
   position.y += velocity.y * dt; 
    
   super.update();
  }
  
  void draw() { 
    colorMode(HSB);
    fill(r, g, b, alpha);
    
    pushMatrix();
    translate(position.x, position.y);
    rotate(rotateAngle);
    rect(-size/2, -size/2, size, size);
    popMatrix();
    
    colorMode(RGB);
  }
  
}
