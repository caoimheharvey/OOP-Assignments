class Human extends GameObject
{
  PVector pos;
  Human(float x, float y)
  {
    pos = new PVector(width * 0.5f, 400);
  }

  void render()
  {    
    rect(pos.x, pos.y, 20, 20);
  }

  void update()
  {
    pos.add(forward);

    if (keyPressed)
    {
      if (key == CODED)
      {
        if (keyCode == UP )
        {
          pos.y -= 20;
        }
        if (keyCode == DOWN )
        {
          pos.y += 20;
        }
        if (keyCode == LEFT )
        {
          pos.x -= 20;
        }
        if (keyCode == RIGHT)
        {
          pos.x += 20;
        }
      }//end key == coded
    }//end key pressed
  }//end update
}

