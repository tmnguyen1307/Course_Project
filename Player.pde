class Player{
  float offX = 0;
  float offY = 0;
  float playerX;
  float playerY;
  float playerSize;
  float groundY;

  int speed=10;
  int gravity = 6;
  int jumpLength = 0;
  int jumpLimit = 20;
  boolean isJumping = false;
  boolean onGround = true;
  boolean isTurned = false;
  boolean move = false;
  
  int form = -1;
  
  Player(int x, int y, int size){ 
    playerX = x;
    playerY = y;
    playerSize = size;
    groundY = y + size/2;
  }
  
  void jump(){
    if (onGround){
      isJumping = true;
      playerY-=1;
    }
  }
 
   void fall(){
   //gravity
    if(playerY < groundY){ 
      playerY += gravity; 
      if (isTurned && playerX-100>0){
        playerX -= 2;
        if (offX>0 && playerX<background_width*2.5)
        offX-=2;
      }
      else{
        if(playerX+100<background_width*3){
          playerX+=2;
        }
        if (offX<background_width*2 && playerX>background_width/2){
        offX+=2;
        }
      }
      onGround = false; 
    } else {
      onGround = true; 
    }
    
    
    if(isJumping){
      playerY -= 15; 
      jumpLength += 1;  
    }
    if(jumpLength >= jumpLimit){ 
      isJumping = false;
      jumpLength = 0; 
    }
}

  void moveRight(){
    isTurned = false;
    if (playerX+100<background_width*3){
      playerX+=10;
    }
    if (offX<background_width*2 && playerX>background_width/2){
      offX+=10;
    }
  }

  void moveLeft(){
    isTurned = true;
    if (playerX-100>0){
      playerX-=10;
    }
    if (offX>0 && playerX<background_width*2.5){
      offX-=10;
    }
  }

  void display(){
      noStroke();
      translate(-offX,-offY);
      backdrop();
      coin();
      float sPX = playerX;
      float sPY = playerY;
      pushMatrix();
      translate(playerX, playerY);
      if (isTurned)
        scale(-1,1);
      playerX = 0; playerY = 0;
      drawPlayer(playerX,playerY);
      popMatrix();
      playerX = sPX;
      playerY = sPY;
    }
    
  float Front(){
    return playerX+50;
  }
  
  float Back(){
    return playerX-50;  
  }
  
  float Top(){
    return playerY-50;
  }
  
  float Bottom(){
    return playerY+50;
  }
  
  void drawPlayer(float x, float y){
    colorMode(RGB,255,255,255);
    fill(0);
    ellipse(x+56,y-5,10,10);
    fill(250,232,162);
    ellipse(x+48,y,20,30); //nose
    fill(255,205,139);
    ellipse(x,y,playerSize,playerSize); //body
    bezier(x+10,y-50,x-10,y-75,x-20,y-55,x,y-45); //ear
    //tail
    beginShape();
    vertex(x-45,y-10);
    vertex(x-57,y-14);
    vertex(x-55,y-9);
    bezierVertex(x-70,y-20,x-80,y,x-90,y);
    bezierVertex(x-80,y,x-90,y,x-80,y);
    vertex(x-84,y+5);
    vertex(x-70,y+2);
    vertex(x-5,y+8);
    bezierVertex(x-75,y+15,x-43,y,x-45,y+5);
    endShape();
    fill(255);    
    ellipse(x+30,y-5,25,40); //eye
    fill(0);
    ellipse(x+40,y-3,8,15); //pupil
  }
}
