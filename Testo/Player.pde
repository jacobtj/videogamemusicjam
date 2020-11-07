class Player extends GameObject {
  private float speed = 200.0;
 
  
  public Player(float x, float y, Game game) {
    super(x, y, 20.0, 50.0, new int[] {0, 255, 0}, game);
  }
  
  void update(float dt) {
    for (Hitbox hitbox: game.getHitboxes()) {
      if (!hitbox.getParent().equals(this)) {
        if (game.collision(this.hitbox, hitbox)) {
          String o = whichOrientation(this.hitbox, hitbox);
          System.out.println(o);
          stopPlayer(o);
        }
      }
    }
    if (isKeyDown('w')) {
      y -= speed * dt;
    }
    if (isKeyDown('s')) {
      y += speed * dt;
    }
    if (isKeyDown('a')) {
      x -= speed * dt;
    }
    if (isKeyDown('d')) {
      x += speed * dt;
    }
    
    super.update(dt);
  }
  
  private String whichOrientation(Hitbox box1, Hitbox box2) {
    //player on top
    if (box1.getY() < box2.getY() && box1.getX() >= box2.getX() 
    && box1.getX() + box1.getWidth() <= box2.getX() + box2.getWidth()) {
      return "top";
    }
    //player on bottom
    else if (box1.getY() + box1.getHeight() > box2.getY() + box2.getHeight() 
    && box1.getX() >= box2.getX() && box1.getX() + box1.getWidth() <= box2.getX() + box2.getWidth()) {
      return "bottom"; 
    } 
    //player on left
    else if (box1.getX() < box2.getX()) {
      return "left";
    }
    //player on right
    else {
      return "right";
    }
  }
  
  private void stopPlayer(String orientation) {
    
  }
  
  public String toString() {
    return "Player";
  }
}
  
  
