class Snake extends GameObject
{
  float speed = 5.0f;
  int lives;
  char left;
  char right;
  float x, y;

  Snake()
  {
    this.x = x;
    this.y = y;
  }

  Snake(float startX, float startY, char right, char left)
  {
    lives = 5;
    x = startX;
    y = startY;
  }

  void render()
  {
    pushMatrix();
    beginShape(TRIANGLES);
    vertex(x, y - 30);
    vertex(x - 10, y - 10);
    vertex(x + 10, y - 10);
    endShape();
    popMatrix();
  }

  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);

    //forward.mult(speed);
    /*
     if (keys['I'])
     {
     pos.add(forward);
     }   
     */
    //in hopes to make the snake move forward constantly with left and right as the 
    //only directional options
    pos.add(forward);
    if (keys[left]) {
      theta -= 0.1f;
    }
    if (keys[right])
    {
      theta += 0.1f;
    }

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

