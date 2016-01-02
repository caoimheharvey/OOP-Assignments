class Snake extends GameObject
{
  float speed = 5.0f;
  int lives;
  char left;
  char right;
  float x, y;

  Snake()
  {
    //super(width * 0.5f, height  * 0.5f);
    this.x = x;
    this.y = y;
    x = width * 0.5f;
    y = height  * 0.5f;
  }

  Snake(char up, char left, char down, char right, float startX, float startY)
  {
    lives = 5;
    x = startX;
    y = startY;
  }

  void render()
  {
    x = width * 0.5f;
    y = height  * 0.5f;
    pushMatrix();
    rect(x + 10, y - 10, 20, 20);
    popMatrix();
  }

  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    forward.mult(speed);


    //code to get the screen to wrap
    if (pos.y - height < 0)
    {
      theta = HALF_PI;
      pos.y = 0;
    }
    if (pos.x + width > width)
    {
      theta = PI;
      pos.x = width;
    }
    if (pos.y > height)
    {
      theta = PI + HALF_PI;
      pos.y = height;
    }
    if (pos.x < 0)
    {
      theta = 0;
      pos.x = 0;
    }
  }
}

