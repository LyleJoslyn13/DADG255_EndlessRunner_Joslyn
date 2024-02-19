class AABB {
  
  PVector position = new PVector();
  PVector velocity = new PVector();
  boolean isDead;
  float w, h;
  float angleToMouse, angleToObject;
  
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
    
     void fixOverlap(AABB other) {
      float pushUp = edgeB - other.edgeT;
      float pushLeft = edgeR - other.edgeL;
      
      if(pushUp <= pushLeft) setBottomEdge(other.edgeT);
      else setRightEdge(other.edgeL);
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
    
     boolean checkCollision(AABB other) {
      if(edgeR < other.edgeL) return false;
      if(edgeL > other.edgeR) return false;
      if(edgeB < other.edgeT) return false;
      if(edgeT > other.edgeB) return false;
      return true;
     }
    
    void calcAngleToMouse() {
      angleToMouse = atan2(mouseY - position.y, mouseX - position.x);
    }
    
    void calcAngleToObject(AABB object) {
      angleToObject = atan2(object.position.y - position.y, object.position.x - position.x);
    }
}
