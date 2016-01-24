class Obstacles extends GameObject
{
  float startx;
  float starty;

  Obstacles(int x, int y)
  {
    starty = random(10);
    startx = random(100, 400);
    obst = new PVector(300, 10);
    s = 1.0f;
    forward = new PVector(0, s);
 
    obst.x = x;
    obst.y = y;
  }

  void render()
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    pushMatrix();
    rect(obst.x, obst.y, random(50), random(50));
    popMatrix();
  }

  void update()
  {
    obst.add(forward);
  }
}

