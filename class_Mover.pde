class Mover {
  float x, y, sx, sy;

  Mover(float a, float b) {
    this.x = a;
    this.y = b;

    this.sx = 0;
    this.sy = 0;
  }

  void move() {
    this.x += this.sx;
    this.y += this.sy;
  }
}
