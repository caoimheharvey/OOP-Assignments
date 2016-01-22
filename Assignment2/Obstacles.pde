class Obstacles extends GameObject
{
  float startx;
  float starty;
  int x1, y1;

  Obstacles()
  {
    starty = random(10);
    startx = random(100, 400);
    obst = new PVector(300, 10);
    s = 1.0f;
    forward = new PVector(0, s);
    x1 = (int)random(10, 75);
    y1 = (int) random(10, 75);
  }

  void render()
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    pushMatrix();
    ellipse(obst.x, obst.y, x1, y1);
    popMatrix();
  }

  void update()
  {
    obst.add(forward);
  }
}

