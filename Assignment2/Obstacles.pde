class Obstacles extends GameObject
{
  float startx;
  float starty;

  Obstacles()
  {
  }

  Obstacles(int x)
  {
    println("OBSTACLE");
    obst = new PVector(x, 10);
    s = 1.0f;
    forward = new PVector(0, s);
  }

  void render()
  {
    println("RENDER");
    stroke(255, 0, 0);
    fill(255, 0, 0);
    pushMatrix();
    rect(obst.x, obst.y, random(50), random(50));
    popMatrix();
  }

  void update()
  {
    println("UPDATE");
    obst.add(forward);
  }
}

