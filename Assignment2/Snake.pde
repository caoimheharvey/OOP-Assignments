//TO BE FIXED--DOESNT LOAD
class Snake
{
  int cx, cy;
  PVector forward; 
  float theta = 0.0f;
  float speed = 5.0f;

  Snake()
  {
    forward = new PVector(0, -1);
    this.theta = 0.0f;
  }

  void render()
  {
    beginShape(TRIANGLES);
    vertex(width * 0.5f, (height * 0.5f) - 30);
    vertex((width * 0.5f) - 10, (height * 0.5f) - 10);
    vertex((width * 0.5f) + 10, (height * 0.5f) - 10);
    endShape();
  }

  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);

    // Move in the direction we are rotated
    forward.mult(speed);
    pos.add(forward);


    if (pos.y - halfW < 0)
    {
      theta = HALF_PI;
      pos.y = halfW;
    }
    if (pos.x + halfW > width)
    {
      theta = PI;
      pos.x = width - halfW;
    }
    if (pos.y + halfW > height)
    {
      theta = PI + HALF_PI;
      pos.y = height - halfW;
    }
    if (pos.x < halfW)
    {
      theta = 0;
      pos.x = halfW;
    }
  }
}

