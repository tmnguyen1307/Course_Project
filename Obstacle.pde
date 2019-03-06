class Obstacle{
  int startingX; 
  int ObstacleX;
  int ObstacleY;
  int move;

  Obstacle(int y){
    ObstacleY = y;
    move = 0;
  }
  
  void drawObstacle(int x){
    startingX = x;
    ObstacleX = x+ move;
    fill(255);
    ellipse(ObstacleX,ObstacleY,80,80);
    move-=5;
  }
  
  int Back(){
    return ObstacleX-40;
  }
  int Front(){
    return ObstacleX+40;
  }
  int Top(){
    return ObstacleY-40;
  }
}
