class Platform{
  int startX;
  int startY;
  int plat_width;
  
  Platform(){
  }
  
  void drawPlatform(int x,int y){
    fill(139,85,31);
    rect(x,y,60,50);
    int end_width = x+60;
    fill(255);
    rect(x,y,60,10);
    beginShape();
    while(x<end_width){
    vertex(x,y+10);
    vertex(x+10,y+20);
    vertex(x+20,y+10);
    x+=20;
    }
    endShape();
    
  }
  
  void display(int x, int y, int plat_num){ 
    startX = x;
    startY = y; 
    plat_width = plat_num*60;
    int z = startX;
    for (int i = 0; i<plat_num; i++){
      drawPlatform(z,startY);
      z+=60;
    }
  }
  
  int startPoint(){ 
    return startX;
  }
  int endPoint(){ 
    return startX+plat_width;
  }
  int top(){ 
    return startY;
  }
} 
