/*
Caoimhe Harvey
 C14724965
 OOP-Assignment 2
 DT282-2
 */


void setup()
{
  size(500, 700);
  z = 10;//counter for collisions
  Human person = new Human();
  gameO.add(person);
  speed = 1.0f;
  c = color(27, 83, 132);
  bw = 0.0f;
}
int c; //background color in draw
int x; 
int colCount = 0; //counts the number of collisions
int z; 
float bw; //border width
float speed;

ArrayList<GameObject> gameO = new ArrayList<GameObject>();

void draw()
{
  //BACKGROUND CODE -------------------------------------------------------------------
  background(0);
  //right side
  fill(255);
  rect(0, 0, (width * bw), height);
  //left
  rect(width, 0, -(width * bw), height);

  //FOR EVERY 60 SECOND DISPLAY NEW OBJECT ----------------------------------------------
  if (frameCount % 60 == 0)
  {
    switch((int) random(0, 5))
    {
    case 0:
    case 1:
      Obstacles obstacle = new Obstacles((int) round(random(50, 450)), 
      (int) round(random(20, 70)), speed);
      gameO.add(obstacle);
      break;
    case 2:
      GameObject powerup = new LivesPU((int) round(random(50, 450)));   
      gameO.add(powerup);
      break;
    case 3: 
    case 4:
      GameObject collection = new Collect((int) round(random(50, 450)));
      gameO.add(collection);
    }
  }

  //DISPLAYING THE GAME --------------------------------------------------------------
  for (int i = gameO.size () - 1; i >= 0; i--)
  {
    GameObject go = gameO.get(i);
    go.update();
    go.render();
  }


  //Collision related code ---------------------------------------------------------
  checkCollision();

  //incrementing border size
  if (colCount == z)
  {
    z += 10;
    speed += 0.5f;
    if (bw <= 0.25f)
    {
      bw += 0.05f;
    }
  }
}

void checkCollision()
{
  for (int i = gameO.size () - 1; i >= 0; i --)
  {
    GameObject h = gameO.get(i);
    if (h instanceof Human)
    {
      for (int j = gameO.size () - 1; j >= 0; j --)
      {
        GameObject other = gameO.get(j);
        if (other instanceof Powerup) 
        {
          if (h.pos.dist(other.pos) < h.rad + other.rad)
          {
            ((Powerup) other).applyTo((Human)h);
            gameO.remove(other);
            colCount++;
          }
        }
      }
    }
  }
}


void startscreen()
{
}

void endscreen()
{
}

