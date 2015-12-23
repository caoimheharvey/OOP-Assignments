class Snake extends GameObject
{
  float speed = 5.0f;
  int lives;
  
  Snake()
  {
  }
  
  Snake(int startX, int startY, char right, char left)
  {
    lives = 5;
  }

  void render()
  {
    pushMatrix();
    beginShape(TRIANGLES);
    vertex(width * 0.5f, (height * 0.5f) - 30);
    vertex((width * 0.5f) - 10, (height * 0.5f) - 10);
    vertex((width * 0.5f) + 10, (height * 0.5f) - 10);
    endShape();
    popMatrix();
  }

  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);

    forward.mult(speed);
    pos.add(forward);


    if (pos.y - height < 0)
    {
      theta = HALF_PI;
      pos.y = halfW;
    }
    if (pos.x + width > width)
    {
      theta = PI;
      pos.x = width - halfW;
    }
    if (pos.y > height)
    {
      theta = PI + HALF_PI;
      pos.y = height - halfW;
    }
    if (pos.x < 0)
    {
      theta = 0;
      pos.x = halfW;
    }
  }
  
}

