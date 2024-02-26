class HealthBar {
  PVector position = new PVector();
  float w, h;
  float maxHealth, currentHealth;
  float mappedHealth;
  float r, g, b;
  float yOffset;

  AABB target;

  HealthBar(AABB target) {
    this.target = target;
    h = 10;
    w = 125;
  }

  void update() {
    position.x = target.position.x;
    position.y = target.position.y - target.halfH - h;
    
    mappedHealth = map(currentHealth, 0, maxHealth, 0, w);

  }
  
  void draw() {
   fill(255, 0, 0);
   rect(position.x - w/2, position.y - h/2, mappedHealth, h);
   noFill();
   stroke(0);
   strokeWeight(2);
   rect(position.x - w/2, position.y - h/2, w, h);
   noStroke();
  }
}
