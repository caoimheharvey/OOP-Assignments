class LivesPU extends GameObject implements Powerup
{
  LivesPU(int x)
  {
    pos = new PVector(x, -15);
    rad = 30;
    forward = new PVector(0, 1);
  }

  void applyTo(Human person)
  {
    person.lives ++;
  }

  void render()
  { //use a circle for now
    stroke(255);
    fill(255,204,153);
    pushMatrix();
    ellipse(pos.x, pos.y, rad, rad);
    popMatrix();
  }

  void update()
  {
    pos.add(forward);
  }
}

