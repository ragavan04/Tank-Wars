Player player1;
Powerup health;
WinDetector win;

int gameScreen, level, turretFlag;
int startButtonX, startButtonY, buttonWidth, buttonHeight;
float tempX, tempY, playerTempX, playerTempY;
PImage startScreen;

ArrayList<Wall> walls = new ArrayList<Wall>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Turret> turrets = new ArrayList<Turret>();

void setup() {
  size(1260, 720);
  noStroke();

  //initialize game settings
  gameScreen = 0;
  level = 1;
  turretFlag = 0;

  startButtonX = 539;
  startButtonY = 373;
  buttonWidth = 180;
  buttonHeight = 49;

  //set up objects
  player1 = new Player();
  health = new Powerup(200, 200);
  win = new WinDetector();

  //create walls
  walls.add(new Wall(651, 0, 25, 243)); 
  walls.add(new Wall(651, 438, 25, 280)); 
  walls.add(new Wall(0, 380, 100, 25)); 
  walls.add(new Wall(0, 259, 100, 25)); 
  walls.add(new Wall(width - 100, 380, 100, 25)); 
  walls.add(new Wall(width - 100, 259, 100, 25)); 
  walls.add(new Wall(370, 241, 25, 231)); 
  walls.add(new Wall(776, 85, 25, 80)); 
  walls.add(new Wall(781, 570, 25, 80));


  startScreen = loadImage("startScreen.jpeg");
}



void draw() {

  //startMenu
  if (gameScreen == 0) {
    background(startScreen);

    fill(#d31616);
    textSize(125);
    text("Tank Wars", width/2 - textWidth("Tank Wars")/2, height/2);

    fill(#e51f1f);
    rect(startButtonX, startButtonY, buttonWidth, buttonHeight);
    textSize(29);
    fill(#010101);
    text("Start Game", startButtonX + 15, startButtonY + 34);
  }

  //in game 
  if (gameScreen == 1) {
    background(#416F12); 

    //call functions on objects
    player1.render1();
    health.render();
    win.detect();

    for (int i=0; i < bullets.size(); i++) bullets.get(i).shoot(); 
    for (int i=0; i < walls.size(); i++) walls.get(i).builder(); 
    for (int i=0; i < turrets.size(); i++) turrets.get(i).build();

    //Levels
    if (level == 1 && turretFlag == 0) {
      turrets.add(new Turret(900, 50, 100));
      turretFlag = 1;
    }

    if (level == 2 && turretFlag == 0) {
      turrets.add(new Turret(900, 50, 100));
      turrets.add(new Turret(1100, height - 50, 100));
      turretFlag = 1;
    }
    if (level == 3 && turretFlag == 0) {
      turrets.add(new Turret(900, 50, 100));
      turrets.add(new Turret(1000, height/2, 100));
      turrets.add(new Turret(1100, height - 50, 100));
      turretFlag = 1;
    }
    if (level == 4 && turretFlag == 0) {
      turrets.add(new Turret(900, 50, 100));
      turrets.add(new Turret(800, 50, 100));
      turrets.add(new Turret(1000, height/2, 100));
      turrets.add(new Turret(1100, height - 50, 100));
      turretFlag = 1;
    }
    if (level == 5 && turretFlag == 0) {
      turrets.add(new Turret(900, 50, 100));
      turrets.add(new Turret(800, 50, 100));
      turrets.add(new Turret(850, 50, 100));
      turrets.add(new Turret(1000, height/2, 100));
      turrets.add(new Turret(1100, height - 50, 100));
      turretFlag = 1;
    }

    //powerup collision
    for (int i=0; i < 1; i++) {
      if (dist(player1.x, player1.y, health.x, health.y) < player1.w) {
        health.x = -100;
        health.sx = 0;
        health.sy = 0;
        player1.life = 3;
      }
    }

    //bullet vs Wall collision
    for (int i=0; i < bullets.size(); i++) {
      for (int j=0; j < walls.size(); j++) {
        if (bullets.get(i).x > walls.get(j).x && bullets.get(i).x < walls.get(j).x + walls.get(j).w && bullets.get(i).y >  walls.get(j).y && bullets.get(i).y < walls.get(j).y + walls.get(j).h) {
          bullets.get(i).x = -100;
          bullets.get(i).y = -100;
        }
      }
    }

    //Bullet Garbage Collection
    for (int i=0; i < bullets.size(); i++) {
      if (bullets.get(i).x < 0 || bullets.get(i).x > width || bullets.get(i).y < 0 || bullets.get(i).y > height) { //if there are random bullets that are not on the screen then remove them
        bullets.remove(i);
      }
    }

    //Bullet vs turret collision
    for (int i=0; i < bullets.size(); i++) {
      for (int j=0; j < turrets.size(); j++) {
        if (bullets.get(i).x > turrets.get(j).x && bullets.get(i).x < turrets.get(j).x + turrets.get(j).w && bullets.get(i).y >  turrets.get(j).y && bullets.get(i).y < turrets.get(j).y + turrets.get(j).h) {
          turrets.get(j).turretLife = turrets.get(j).turretLife - 1;
          bullets.get(i).x = -100;
          bullets.get(i).y = -100;
          if (turrets.get(j).turretLife == 0) {
            turrets.remove(j);
          }
        }
      }
    }
  }

  //game over screen
  if (gameScreen == 2) {
    background(#000000);
    fill(#ffffff);
    text("Game Over", width/2 - textWidth("Tank Wars")/2, height/2);
  }
}

void mousePressed() {
  //if mouse is pressed player can shoot bullet
  bullets.add(new Bullet(player1.x + player1.w, player1.y + player1.w / 2, mouseX, mouseY));

  //start game button
  if (mouseX > startButtonX && mouseX < startButtonX + buttonWidth && mouseY > startButtonY && mouseY < startButtonY + buttonHeight) {
    gameScreen = 1;
  }
}
