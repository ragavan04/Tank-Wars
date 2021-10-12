class WinDetector {
  int x, y, w, h;
  int flag;



  WinDetector() {
    this.x = width - 100;
    this.y = 260;
    this.w = 100;
    this.h = 120;
    this.flag = 1;
  }



  void detect() {

    fill(#1F1DCB);
    rect(this.x, this.y, this.w, this.h);


    if (player1.x > this.x && player1.x < this.x + this.w && player1.y + player1.w > this.y && player1.y < this.y + this.h) {
      player1.x = 20;
      player1.y = 310;
      player1.life = 3;
      level++;
      turretFlag = 0;
    }


  }
}
