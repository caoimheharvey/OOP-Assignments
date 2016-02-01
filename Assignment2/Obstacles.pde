class Obstacles extends GameObject implements Powerup
{
  int w;

  Obstacles(int x, int w, float s)
  {
    this.w = w;
    rad = w;
    pos = new PVector(x, -15);
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
    rect(pos.x, pos.y, w, w, 5);
    popMatrix();
  }

  void update()
  {
    pos.add(forward);
  }
}

