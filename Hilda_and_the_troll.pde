//Inspiration: Hilda and the Trolls - Luke Pearson
//Use the arrow keys to move the player. Press 'R' to reset the game. 
//The goal of the game is to eat the coins and stay alive.

import processing.sound.*;

SoundFile jumping;
SoundFile deathsound;
SoundFile eatcoin;

Player player;
Platform[] plats = new Platform[100];
Obstacle[] obstacles = new Obstacle[100];
Coin[] coins = new Coin[300];

int score = 0;
int fade = 0;
int originalGroundY = 900;
boolean onPlatform = false;
int background_height = 1080;
int background_width = 1920;
boolean debugged = false;

void setup(){
  size(1152,648);
  jumping = new SoundFile(this, "Jumping.wav");
  deathsound = new SoundFile(this, "Death.wav");
  eatcoin = new SoundFile(this, "Coin_eating.wav");
  
  player = new Player(100,originalGroundY-50 ,100);
  for (int i = 0; i<100; i++){
    plats[i] = new Platform();
  }
  for (int i = 0; i<100; i++){
    obstacles[i] = new Obstacle(900);
  }
  for (int i = 0; i<300; i++){
    coins[i] = new Coin();
  }
}

void draw(){
  background(255);
  scale(0.6);
  player.display(); 
  eat();            
  platform();       
  obstacle();       
  player.fall();    
  collision();      
  JumpOnPlatform();
  JumpOffPlatform();
  if (player.playerX>5300){
    gameComplete();
  }
}

void keyPressed(){
  switch(keyCode){
  case UP:
      player.jump();
      jumping.play();
      break;
  case RIGHT:
      player.moveRight();
      break;
  case LEFT:
      player.moveLeft();
      break;
  case 'R':
      reset();
  case 'D':
      debugged = !debugged;
    } 
}

void JumpOnPlatform(){ //detect a platform and jump on it 
  for (int i = 0; i<99; i++){
    if (player.Bottom()-10<plats[i].top() && player.Front()>plats[i].startPoint()){
      onPlatform = true;
      player.groundY = plats[i].top()-50;
      player.form = i;
    }
  }
}

void JumpOffPlatform(){ //detect the end of the platform and get off it
    if (player.form != -1)
      if (player.playerX>plats[player.form].endPoint() || player.Front()<plats[player.form].startPoint()){
        player.groundY = originalGroundY;
        onPlatform = false;
        player.form = -1;
    }
}

void collision(){ //collision between the player and the obstacles
  for (int i = 0; i<100; i++){
    if (player.Front()>obstacles[i].Back() && player.Front()<obstacles[i].Front() 
    && player.Bottom()>obstacles[i].Top() && onPlatform == false){
      deathsound.play();
      delay(1000);
      reset();
    }
  }
}

void eat(){ //enable the player to eat the coins
  for (int i = 0; i<300; i++){
    if (player.Front()> coins[i].getX() && player.Back()<coins[i].getX() && player.groundY == coins[i].getY()){
      coins[i].eaten = true;
      eatcoin.play();
      score+=1;
    }
  } 
}

void reset(){ //reset the game
  player.playerX = 100;
  player.playerY = originalGroundY; 
  for (int i = 0; i<100; i++){
    obstacles[i].move = 0;
  }
  player.offX=0;
  score = 0;
  for (int i = 0; i<300; i++){
     coins[i].eaten = false;
  }
}

void gameComplete(){ //show up when the player pass through a particular point at the end
  colorMode(RGB,255);
  noStroke();
  fill(0, 0, 0, fade);
  rect(background_width*2, 0, background_width, background_height);
  fade += 2;
  textSize(50);
  fill(255);
  text("GAME OVER", background_width*2.4, background_height/2);
  text("HIGH SCORE: "+score, background_width*2.4-30,background_height/2+60);
}

void platform(){ //initialize all the platforms for the game
  plats[0].display(300,800,4);
  plats[1].display(800,800,5);
  plats[2].display(1200,800,4);
  plats[3].display(1400,700,5);
  plats[4].display(1600,600,5);
  plats[5].display(1900,800,6);
  plats[6].display(2100,800,6);
  plats[7].display(2300,700,5);
  plats[8].display(2600,600,3);
  plats[9].display(2800,800,7);
  plats[10].display(3200,700,5);
  plats[11].display(3500,800,5);
  plats[12].display(3900,800,4);
  plats[13].display(4600,800,7);
}

void obstacle(){ //initialize all the obstacles for the game
  int firstO = 1900;
  for (int i = 0; i<30; i++){
    obstacles[i].drawObstacle(firstO);
    firstO+=int(random(100,1000));
  }
}

void coin(){ //initialize all the coins for the game
  coinRow(350,750,3,0);
  coinRow(600,900,5,3);
  coinRow(850,750,4,8);
  coinRow(1250,750,3,12);
  coinRow(1650,550,4,15);
  coinRow(1950,750,5,19);
  coinRow(2350,650,4,24);
  coinRow(2650,550,2,28);
  coinRow(3250,650,4,30);
  coinRow(2000,900,10,34);
  coinRow(3950,750,3,44);
  coinRow(4650,750,6,47);
  coinRow(3500,900,12,53);
  coinRow(2850,750,6,65);
}

void coinRow(int x, int y, int count,int j){ 
  for (int i = j; i<j+count; i++){
    coins[i].display(x,y);
    x+=60;
  }    
}
