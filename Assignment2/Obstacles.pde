class Obstacles extends GameObject
{
  float startx;
  float starty;
  int w;

  Obstacles(int x, int w)
  {
    println("OBSTACLE");

    this.w = w;

    obst = new PVector(x, 10);
    s = 1.0f;
    forward = new PVector(0, s);
  }

  void render()
  {
    println("RENDER");
    stroke(255, 0, 0);
    fill(127);
    pushMatrix();
    rect(obst.x, obst.y, w, w);
    popMatrix();
  }

  void update()
  {
    println("UPDATE");
    obst.add(forward);
  }
}

