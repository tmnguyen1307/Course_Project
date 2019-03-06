int groundY = 950;
int alpha = 255;

void boulder(float x,float y,float w,float h){
  beginShape();
  vertex(x,y);
  bezierVertex(x+30,y-h*0.7,x+w+20,y-h,x+w*1.5,y);
  endShape();
}

void tree(int x, int y, int w, int h){
  fill(15,36,45);
  for (int i =0; i<3; i++){
    triangle(x, y, x-w/2,y+h, x+w/2,y+h);
    y-=h*0.3;
  }
}

void Big_boulder(float x,float y,float w,float h){
    fill(349,45,73,1);
    boulder(x,y,w,h);
    boulder(x+w/2,y,w*1.5,h*1.2);
    boulder(x+w*1.4,y,w*1.2,h*0.6);
}

void mountain(float x,float y,float w,float h){
  beginShape();
  vertex(x,y);
  bezierVertex(x+40,y-h*0.7,x+w+20,y-h,x+w*1.5,y);
  endShape();
  fill(0,0,100);
  beginShape();
  vertex(x+w*0.26,y-h*0.5);
  float j = 0.4;
  for (int i=0;i<4;i++){
    bezierVertex(x+w*j,y-h*0.5+30,x+w*j,y-h*0.5+30,x+w*(j+0.1),y-h*0.5);
    j+=0.2;
  }
  vertex(x+w*1.15,y-h*0.5);
  bezierVertex(x+w,y-h*0.7,x+w/2,y-h*0.7,x+w*0.25,y-h*0.5);
  endShape();
  }

void cloud(float x, float y, float w, float h){
  fill(353,0,99);
  ellipse (x,y, w,h);
  ellipse (x+w*0.6, y+h*0.2, w, h);
  ellipse (x-w*0.6, y+h*0.2, w, h);
  ellipse (x+w*0.8, y+h*0.6, w, h);
  ellipse (x-w*0.8, y+h*0.6, w, h);
  ellipse (x, y+h*0.9, w, h);
}

void snow(float x, float y,float boundary){
  fill(353,0,99);
  randomSeed(2);
  int snow_height = 30;
  while(x<boundary){
  ellipse (x, y+random(0,10), random(50,200), snow_height); 
  x+=random(0,50);
  }
}

void backdrop(){
  colorMode(HSB,360,100,100,1);
  
  if (debugged == true){
    stroke(0);
    strokeWeight(1);
  }
  else{
    noStroke();
  }
  
  //sky
  float saturation = 39;
  for (int skyY = 0; skyY<background_height;skyY+=150){
    fill(29,saturation,99);
    rect(0,skyY,background_width*5,150);
    saturation-=4;
  }
   //ground
  fill(19,52,81);
  rect(0,groundY,background_width*5,background_height);
  
  Big_boulder(350,groundY,50,400);
  Big_boulder(1300,groundY,80,400);
  Big_boulder(1700,groundY,50,300);
  cloud(1100,250,200,100);
 
  //cloud
  cloud(2300,300,100,50);
  cloud(2350,300,100,50);
  cloud(2450,200,50,20);
  cloud(2600,400,50,20);
  cloud(3200,200,100,50);
  cloud(3670,150,150,50);
  cloud(3400,400,80,40);
  cloud(5000,400,80,40);
  cloud(3900,300,100,50);
  cloud(4100,200,100,50);
  cloud(4600,100,150,70);
  cloud(5300,100,150,70);
  cloud(5500,200,100,50);
  
  //mountain
  fill(35,47,62);
  mountain(3900,groundY,500,1000);
  fill(35,47,62);
  mountain(4500,groundY,400,700);
  fill(35,47,62);
  mountain(5300,groundY,400,1000);
  fill(31,40,90);
  mountain(2660,groundY,200,500);
  fill(31,40,90);
  mountain(3300,groundY,200,550);
  fill(31,50,90);
  mountain(2280,groundY,300,700);
  fill(31,50,90);
  mountain(2900,groundY,300,700);
  fill(31,60,90);
  mountain(1920,groundY,300,800);
  fill(31,60,90);
  mountain(3500,groundY,300,800);
  
  tree(4300,730,100,220);
  tree(4200,750,100,200);
  tree(5000,750,100,200);
  tree(5080,660,100,300);
  tree(5620,750,100,200);
  tree(5700,660,100,300);
  tree(5780,750,100,200);
  
  fill(0);
  boulder(5300,950,100,400);
  snow(0,groundY,background_width*4); 
  Big_boulder(-150,groundY,100,500);
  


}
