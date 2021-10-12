class Turret extends Mover {
  int w, h;
  int flag = 0;
  int turretLife;
  float coolDown, coolDownHolder;
  PImage turret;

  Turret(float x, float y, float coolDown) {
    super(x, y);

    this.turretLife = 3;
    this.coolDown = coolDown;
    this.coolDownHolder = coolDown;
    this. sy = random(1, 4);
    this.w = 70;
    this.h= 50;
    
    turret = loadImage("turret.png");
  }


  void build() {
    this.move(); 

    fill(#C19012);
    image(turret, this.x, this.y, this.w, this.h);

    if (this.y < 0) this.sy *= - 1;
    else if (this.y > height - this.h) this.sy *= -1;

    if (flag == 0) {
      coolDown = coolDown - 1;
      if (coolDown == 0) {
        flag = 1;
      }
    }

    if (flag == 1) {
      fill(255, 0, 0);
      bullets.add(new Bullet(this.x, this.y + this.h / 2, 0, this.y));
      flag = 0;
      coolDown = coolDownHolder;
    }



  }
}
