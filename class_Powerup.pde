class Powerup extends Power {

  Powerup(float x, float y) {
    super(x, y);

    this.sx = 1;
    this.sy = 1;
  }


  void render() {
    this.power();

    fill(#bb06fe);
    ellipse(this.x, this.y, this.size, this.size);
  }
}
