class LivesPU extends GameObject implements FallingObjects
{

  LivesPU(int x, int y)
  {
    pos = new PVector(x, y);
    rad = 20;
    forward = new PVector(0, 3.0f);
  }

  void applyTo(Human person)
  {
    if (person.lives <= 9)
    {
      person.lives ++;
    }
  }

  void render()
  { //use a circle for now
    noStroke();
    fill(255, 253, 93);
    pushMatrix();
    triangle(pos.x - 15, pos.y, pos.x + (rad /2), pos.y - rad, pos.x + (rad + 15), pos.y);
    rect(pos.x, pos.y, rad, rad + 10);    
    popMatrix();
  }

  void update()
  {
    pos.add(forward);
  }
}