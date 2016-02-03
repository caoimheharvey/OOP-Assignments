/*
Caoimhe Harvey
 C14724965
 OOP-Assignment 2
 DT282-2
 */


void setup()
{
  size(500, 700);
  z = 5;//counter for collisions
  Human person = new Human();
  gameO.add(person);
  speed = 1.0f;
  c = color(27, 83, 132);
  bgap = 0.0f;
}


int c; //background color in draw
int x; 
int colCount = 0; //counts the number of collisions
int z; 
float bgap; //border width
float speed;
float bw; 

ArrayList<GameObject> gameO = new ArrayList<GameObject>();


void draw()
{
  //BACKGROUND CODE -------------------------------------------------------------------
  background(c);
  //right side
  fill(40, 196, 64);
  rect(0, 0, width * bgap, height);
  //left
  rect(width, 0, - width * bgap, height);

  bw = width * bgap;
  //FOR EVERY 60 SECOND DISPLAY NEW OBJECT ----------------------------------------------
  if (frameCount % 60 == 0)
  {
    switch((int) random(0, 5))
    {
    case 0:
    case 1:
    case 2:
      Obstacles obstacle = new Obstacles((int) round(random(bw, width - bw - 70)), 
      (int) round(random(20, 70)), speed);
      gameO.add(obstacle);
      break;
    case 3:
      GameObject powerup = new LivesPU((int) round(random(bw, width - bw)));   
      gameO.add(powerup);
      break;
    case 4: 
      GameObject collection = new Collect((int) round(random(bw, width - bw)));
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
  checkBorders();

  //incrementing border size
  if (colCount == z)
  {
    z += 10;
    speed += 0.5f;
    if (bgap <= 0.2f)
    {
      bgap += 0.05f;
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
            if (other.pos.y > 510) {
              println("nada");
            } else
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
}

//if human is outside of the boundaries and displays appropiate messages with appropiate action
void checkBorders()
{
  GameObject pers = new Human();
  if (pers.pos.x < bw || pers.pos.x > -(bw))
  { 
    //println("OUT OF BOUNDS");
  } else 
  {
    //println(" ");
  }
}

void startscreen()
{
}

void endscreen()
{
}

