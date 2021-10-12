float bulletSpeed = 3.5;

class Bullet extends Mover {
  Bullet(float x1, float y1, float x2, float y2) {
    super(x1, y1); //This is a call to Movers constructor


    float hyp = dist(x1, y1, x2, y2);  

    float dx = x2 - x1;
    float dy = y2 - y1;

    this.sx = bulletSpeed * dx / hyp;
    this.sy = bulletSpeed * dy / hyp;
  }

  void shoot() {
    this.move();

    fill(#9A16DE);
    ellipse(this.x, this.y, 5, 5);
  }
}
