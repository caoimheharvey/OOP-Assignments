class Human extends GameObject
{
  int lives;
  
  Human()
  {
    pos = new PVector(260, 400);
    lives = 5;
  }

  void render()
  {    
    fill(255);
    ellipse(pos.x, pos.y, 20, 20);
  }

  void update()
  {
    if (keyPressed)
    {
      if (key == CODED)
      {
        if (keyCode == LEFT )
        {
          pos.x -= 10;
        }
        if (keyCode == RIGHT)
        {
          pos.x += 10;
        }
        if (keyCode == SHIFT)
        {
          //firing bullets

        }
      }//end key == coded
    }//end key pressed

    if (pos.x < 0)
    {
      pos.x = width;
    }

    if (pos.x > width)
    {
      pos.x = 0;
    }
  }//end update
}

