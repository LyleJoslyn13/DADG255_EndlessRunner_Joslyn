class Floatie {
  
 PVector position = new PVector();
 PVector velocity = new PVector();
 int damageNumber;
 boolean isDead = false;
 
 float lifeTime = 3;
 
 Floatie(float xPos, float yPos, float damage) {
   position.x = xPos;
   position.y = yPos;
   damageNumber = floor(damage);
  
   velocity.x = random(-100, 100);
   velocity.y = random(-500, -300);
 }
 
 void update() {
   
   lifeTime -= dt;
   
   velocity.y += GRAVITY * dt;
   
   position.x += velocity.x * dt;
   position.y += velocity.y *dt;
   
   if(lifeTime <= 0) isDead = true;
 }
 
 void draw() {
   fill(255, 0, 0);
   textAlign(CENTER, CENTER);
   textSize(18);
   text(damageNumber, position.x, position.y);
 }
  
}
