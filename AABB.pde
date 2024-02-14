class AABB {
  
  PVector position = new PVector();
  PVector velocity;
  boolean isDead;
  float w, h;
  
  
   // AABB Properties
    float edgeL = 0;
    float edgeR = 0;
    float edgeT = 0;
    float edgeB = 0;
    float halfW = 0;
    float halfH = 0;

  
  AABB() {
    
  }
  
  
  void update() {
   calcEdges(); 
  }
  
    void calcEdges() {
      edgeL = position.x - halfW;
      edgeR = position.x + halfW;
      edgeT = position.y - halfH;
      edgeB = position.y + halfH;
    }
  
    void setSize(float w, float h) {
      this.w = w;
      this.h = h;
      halfW = w/2;
      halfH = h/2;
      calcEdges();
    }
    
    void setBottomEdge(float Y) {
      position.y = Y - halfH;
      velocity.y = 0;
      calcEdges();
    }
    void setRightEdge(float X) {
      position.x = X - halfW;
      velocity.x = 0;
      calcEdges();
    }
}
