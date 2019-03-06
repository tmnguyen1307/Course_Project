class Coin{
  int coinX;
  int coinY;
  int originalY;
  boolean eaten = false;
  
  Coin(){
  }
  
  void display(int x,int y){
    coinX = x;
    originalY = y;
    if (!eaten){
      coinY = originalY;
    }
    else{
      coinY = -200;
    }
    strokeWeight(3);
    stroke(41,76,99);
    fill(61,76,99);
    ellipse(coinX,coinY,40,40);
    ellipse(coinX,coinY,25,25);
    noStroke();
  }
  
  int getX(){
    return coinX;
  }
  int getY(){
    return coinY;
  }
}
