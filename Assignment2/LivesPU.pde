class LivesPU extends GameObject implements Powerup
{
  int p;
  PVector obj; 
  LivesPU(int x)
  {
    pos = new PVector(x, 10);
    rad = 15;
    forward = new PVector(0, 1);
  }

  void applyTo(Human person)
  {
    person.lives ++;
  }

  void render()
  { //use a circle for now
    pushMatrix();
    ellipse(pos.x, pos.y, rad, rad);
    popMatrix();
  }

  void update()
  {//not working
    pos.add(forward);
  }
}

