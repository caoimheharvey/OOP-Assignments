class Human extends GameObject
{  
  int lives;
  int points;
  Human()
  {
    pos = new PVector(260, 500);
    lives = 5;
    rad = 20;
    points = 0;
  }

  void render()
  {    
    stroke(0);
    fill(255);
    ellipse(pos.x, pos.y, rad, rad);
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
      }//end key == coded
    }//end key pressed


    //if human reaches the edge of the screen they are 
    //returned to the starting point on the screen
    if (pos.x < 0)
    {
      pos.x = width / 2;
    }

    if (pos.x > width)
    {
      pos.x = width / 2;
    }
  }//end update
}

