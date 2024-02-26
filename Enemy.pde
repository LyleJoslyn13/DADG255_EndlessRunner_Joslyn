class Enemy extends AABB {
  
  float maxHealth = 100, currentHealth = maxHealth;
  float damagePool = 0;
  
  HealthBar bar;
  
  Enemy(){
    
    bar = new HealthBar(this);
    bar.maxHealth = maxHealth;
    velocity.x = -150;
    velocity.y = 0;
    position.x = width + 100;
    position.y = height/2;
    setSize(50, 50);
  }
  
  void update() {
    
    velocity.y += GRAVITY * dt;
    
    position.x += velocity.x * dt;
    position.y += velocity.y * dt;
    
    calcDamage();
    
    bar.currentHealth = currentHealth;
    bar.update();
    
    if(currentHealth < 0) isDead = true;
    
    if(position.y >= height - 100 - halfH) {     // collision with ground //
     position.y = height - 100 - halfH;
     velocity.y = 0;
    }
    
    super.update();
  }
  
  void draw() {
   fill(60, 0, 0); 
   rect(position.x - halfH, position.y - halfH, w, h);
    
   bar.draw();
  }
  
  void calcDamage() {
   
    if(damagePool > 0) {
      currentHealth -= damagePool * dt * 10;
      damagePool -= damagePool * dt * 10;
    }
    
    if(damagePool <=0) damagePool = 0;
    
  }
  
}
