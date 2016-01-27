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
}

int x, y; 
int gap = 10; 
int colCount = 0; //counts the number of collisions
int z; 
float bw = 0; //border width
float speed;

ArrayList<GameObject> gameO = new ArrayList<GameObject>();

void draw()
{
  background(0);
  
  if (frameCount % 60 == 0)
  {
    switch((int) random(0, 3))
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
    }
  }
  
  
  for (int i = gameO.size () - 1; i >= 0; i--)
  {
    GameObject go = gameO.get(i);
    go.update();
    go.render();
  }


//Collision related code ---------
  checkCollision();
  
  //incrementing border size
  if(colCount == z)
  {
    if(bw <= 30)
    {
      bw *= 0.5f;
      z += 10;
      speed += 0.5f;
    }
  }
}

void checkCollision()
{
  for (int i = gameO.size () - 1; i >= 0; i --)
  {
    GameObject go = gameO.get(i);
    if (go instanceof Human)
    {
      for (int j = gameO.size () - 1; j >= 0; j --)
      {
        GameObject other = gameO.get(j);
        if (other instanceof Powerup) 
        {
          if (go.pos.dist(other.pos) < go.rad + other.rad)
          {
            ((Powerup) other).applyTo((Human)go);
            gameO.remove(other);
            colCount++;
          }
        }
      }
    }
  }
}

