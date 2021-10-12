class Wall {
  int x, y, w, h;
  PImage walls;

  Wall(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;

    this.w = w;
    this.h = h;

    walls = loadImage("walls.png");
  }

  void builder() {

    fill(#7E5E40);
    rect( x, y, w, h);
  }
}
