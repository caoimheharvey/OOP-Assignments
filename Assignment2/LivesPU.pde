class LivesPU extends GameObject implements Powerup
{
  int radius; 
  int p;
  PVector move;
  PVector obj; 
  LivesPU()
  {
    radius = 15;
    move = new PVector(0, -2);
    p = 30;
  }

  void applyTo(Human person)
  {
    person.lives ++;
  }

  void render()
  {
    pushMatrix();
    //translate(obj.x, obst.y);
    rotate(0.0f);
    fill(255);
    rect(- radius, - radius, p, p);
    popMatrix();
  }

  void update()
  {
    obj.add(move);
    println("POWER UPDATE");
  }
}

