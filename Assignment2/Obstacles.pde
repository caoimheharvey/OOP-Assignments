class Obstacles extends GameObject implements Powerup
{
  float startx;
  float starty;
  int w;

  Obstacles(int x, int w)
  {
    this.w = w;
    rad = w;
    pos = new PVector(x, 10);
    s = 1.0f;
    forward = new PVector(0, s);
  }

  void applyTo(Human person)
  {
    person.lives --;
  }
  
  void render()
  {
    stroke(255, 0, 0);
    fill(127);
    pushMatrix();
    rect(pos.x, pos.y, w, w);
    popMatrix();
  }

  void update()
  {
    pos.add(forward);
  }
}

