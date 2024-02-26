// Endless Runner
// Copyright Lyle Joslyn 2024
// Controls

float dt, prevTime = 0;

final float GRAVITY = 981;

Player player;
ArrayList<Platform> platforms = new ArrayList();
ArrayList<Particle> particles = new ArrayList();
ArrayList<Grenade> grenades = new ArrayList();
ArrayList<Enemy> enemies = new ArrayList();

float platformSpawnCD = 2;
float enemyspawnCD = 1;

void setup() {
  size(800, 600);
  noStroke();
  player = new Player();
}

void draw() {
  calcDeltaTime();
  background(128);
 
 // SPAWN ALL OBJECTS UNDER THIS LINE //
 
 enemySpawnCD -= dt;
 if(EnemySpawnCD <= 0) {
   Enemy e = new enemy(); 
   enemies.add(e);
   //ERROR GET CODE FROM VARUUN //
 }
 
 platformSpawnCD -= dt;
 if(platformSpawnCD <= 0) {
   // Randomize platform sizes and positions. //
   float xPos = width + 100;
   float yPos = random(300, 450);
   float pWidth = random(200, 350);
   float pHeight = 75;
   
   Platform p = new Platform(xPos, yPos, pWidth, pHeight);
   platforms.add(p);
   
   platformSpawnCD = random(2, 4);
 }
 
 
 // UPDATE ALL OBJECTS UNDER THIS LINE //
 
 for(int i = 0; i < platforms.size(); i++) {
   Platform p = platforms.get(i);
   p.update();
   
   // COLLISION WITH PLATFORM
   if(p.checkCollision(player)) {
     player.isGrounded = true;
     player.numJumps = 0;
     player.fixOverlap(p);
     player.velocity.x = p.velocity.x;
     player.friction = 1;
   }
   
   if(p.isDead) platforms.remove(p);
 }
 
 for(int i = 0; i < particles.size(); i++) {
   Particle p = particles.get(i);
   p.update();
   
   if(p.isDead) particles.remove(p);
 }
 
 for(int i = 0; i < grenades.size(); i++) {
   Grenade g = grenades.get(i);
   g.update();
   
   for(int j = 0; j< platforms.size(); j++) {
    Platform p = platforms.get(j);
     if(g.checkCollision(p)) {
      g.fixOverlap(p);
      
     }
   }
   
   if(g.isDead) grenades.remove(g);
 }
 
 for(int i = 0; i < enemies.size(); i++) {
   Enemy e = enemies.get(i);
   e.update();
 }
 
  player.update();
  
  
  // DRAW ALL OBJECTS UNDER THIS LINE //
  fill(#FFB56F);
  rect(0, height-100, width, 150);
  
  for(int i = 0; i < platforms.size(); i++) {
   Platform p = platforms.get(i);
   p.draw();
  }
  
  for(int i = 0; i < particles.size(); i++) {
   Particle p = particles.get(i);
   p.draw();
  }
  
  for(int i = 0; i < grenades.size(); i++) {
   Grenade g = grenades.get(i);
   g.draw();
  }
  
  for(int i = 0; i < enemies.size(); i++) {
   Enemy e = enemies.get(i);
   e.draw();
  }
  
  player.draw();

// Prep for next frame //
  Keyboard.update();
  Mouse.update();
}

void keyPressed() {
  Keyboard.handleKeyDown(keyCode);
}

void keyReleased() {
  Keyboard.handleKeyUp(keyCode);
}

void mousePressed() {
  if(mouseButton == LEFT) Mouse.handleKeyDown(Mouse.LEFT);
  if(mouseButton == RIGHT) Mouse.handleKeyDown(Mouse.RIGHT);
  if(mouseButton == CENTER) Mouse.handleKeyDown(Mouse.CENTER);
}

void mouseReleased() {
  if(mouseButton == LEFT) Mouse.handleKeyUp(Mouse.LEFT);
  if(mouseButton == RIGHT) Mouse.handleKeyUp(Mouse.RIGHT);
  if(mouseButton == CENTER) Mouse.handleKeyUp(Mouse.CENTER);
}

void calcDeltaTime(){
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}
