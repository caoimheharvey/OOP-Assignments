class Human extends GameObject
{  
  int lives;
  int points;

  Human(int x, int y)
  {
    pos = new PVector(x, y);
    lives = 5;
    rad = 20;
    points = 0;
    obc = 0;
  }

  void render()
  {    
    noStroke();
    fill(255);
    ellipse(pos.x, pos.y, rad, rad);
    //failed attempt to make object 3D
    //    lights();
    //    translate(pos.x, pos.y, 0);
    //    sphereDetail(10);
    //    sphere(rad);
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