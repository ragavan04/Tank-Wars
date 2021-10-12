class Player {
  int w, h, life, life1x, life2x, life3x;
  float x, y, sx, sy;
  PImage  player, hearts;


  Player() {



    this.w = 70;
    this.h = 50;
    this.x = 20;
    this.y = 310;
    this.sx = 3;
    this.sy = 3;
    this.life = 3;
    this.life1x = 10;
    this.life2x = 40;
    this.life3x = 70;

    player = loadImage("player.png");
    hearts = loadImage("hearts.png");
  }

  void render1 () {


    fill(255, 0, 0);
    image(player, this.x, this.y, this.w, this.h);

    if (key == CODED) {
      if (keyCode == RIGHT) {
        x = x + sx;
      } else if (keyCode == LEFT) {
        x = x - sx;
      } else if (keyCode == UP) {
        y = y - sy;
      } else if (keyCode == DOWN) {
        y = y + sy;
      }
    }

    //player vs wall colision
    for (int i=0; i < walls.size(); i++) {
      if (player1.x > walls.get(i).x && player1.x < walls.get(i).x + walls.get(i).w && player1.y> walls.get(i).y && player1.y < walls.get(i).y + walls.get(i).h) { //left corner
        player1.x = player1.x + player1.sx;
        player1.y = player1.y + player1.sy;
      }
      if (player1.x + player1.w > walls.get(i).x && player1.x < walls.get(i).x + walls.get(i).w && player1.y> walls.get(i).y && player1.y < walls.get(i).y + walls.get(i).h) { //right corner
        player1.x = player1.x - player1.sx;
        player1.y = player1.y + player1.sy;
      }
      if (player1.x + player1.w > walls.get(i).x && player1.x < walls.get(i).x + walls.get(i).w && player1.y + player1.w> walls.get(i).y && player1.y < walls.get(i).y + walls.get(i).h) { // bottom right
        player1.x = player1.x - player1.sx;
        player1.y = player1.y - player1.sy;
      }
      if (player1.x > walls.get(i).x && player1.x < walls.get(i).x + walls.get(i).w && player1.y + player1.w> walls.get(i).y && player1.y < walls.get(i).y + walls.get(i).h) { // bottom left   
        player1.x = player1.x - player1.sx;
        player1.y = player1.y - player1.sy;
      }
    }

    //playerLife display
    if (this.life == 3) {
      image(hearts, this.life1x, 10, 30, 30);
      image(hearts, this.life2x, 10, 30, 30);
      image(hearts, this.life3x, 10, 30, 30);
    }
    if (this.life == 2) {
      image(hearts, this.life1x, 10, 30, 30);
      image(hearts, this.life2x, 10, 30, 30);
    }
    if (this.life == 1) {
      image(hearts, this.life1x, 10, 30, 30);
    }

    //player vs bullet collision
    for (int i=0; i < bullets.size(); i++) {
      if (dist(player1.x, player1.y, bullets.get(i).x, bullets.get(i).y) < player1.w) {
        player1.life = player1.life - 1;
        bullets.remove(i);
        if (player1.life == 0) {
          gameScreen  = 2;
        }
      }
    }
  }
}
