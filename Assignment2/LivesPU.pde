class LivesPU extends GameObject implements Powerup
{
  int radius; 
  int p;
  PVector obj; 
  LivesPU()
  {
    radius = 15;
    p = 30;
  }

  void applyTo(Human person)
  {
    person.lives ++;
  }

  void render()
  { //use a circle for now
    pushMatrix();
    //translate(pos.x, pos.y);-- issues
    rotate(0.0f);
    float lastX = 0; 
    float lastY = - radius;
    int sides = 5;
    float thetaInc = TWO_PI / 5;
    for (int i = 0; i <= 5; i ++)
    {
      float t = i * thetaInc;
      float x = sin(t) * radius;
      float y = -cos(t) * radius;
      line(lastX, lastY, x, y);
      lastX = x;
      lastY = y;
    }
    popMatrix();
  }

  void update()
  {//not working
    //pos.add(forward);
    //println("POWER UPDATE");
  }
}

