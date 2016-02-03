class LivesPU extends GameObject implements Powerup
{
  LivesPU(int x)
  {
    pos = new PVector(x, -15);
    rad = 20;
    forward = new PVector(0, 3);
  }

  void applyTo(Human person)
  {
    person.lives ++;
  }

  void render()
  { //use a circle for now
    noStroke();
    fill(255, 253, 93);
    pushMatrix();
    rect(pos.x, pos.y, rad, rad + 10);
    triangle(pos.x - 15, pos.y, pos.x + (rad /2), pos.y - rad, pos.x + (rad + 15), pos.y);
    
    popMatrix();
  }

  void update()
  {
    pos.add(forward);
  }
}

