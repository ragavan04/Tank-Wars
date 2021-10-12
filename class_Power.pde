class Power {
  float x, y, sx, sy, size;


  Power(float x, float y) {

    this.x = x;
    this.y = y;

    this.sx = 0;  
    this.sy = 0;  

    this.size = 20;
  }

  void power() {


    this.x += this.sx;
    this.y += this.sy;

    if (this.x < 0) this.sx *= - 1;
    else if (this.x > width - this.size) this.sx *= -this.sx;
    if (this.y < 0) this.sy *= - 1;
    else if (this.y > height - this.size) this.sy *= -this.sy;
  }
}
