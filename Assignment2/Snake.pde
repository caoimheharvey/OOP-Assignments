class Snake extends GameObject
{ 
  int[] headx = new int[2000];
  int[] heady = new int[2000];
  PVector pos = new PVector(200, 300);
  int snakelength;
  Snake()
  {
    snakelength = 3;
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

