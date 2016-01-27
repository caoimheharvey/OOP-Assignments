/*
Caoimhe Harvey
 C14724965
 OOP-Assignment 2
 DT282-2
 */


void setup()
{
  size(500, 500);
  z = 10;//counter for collisions
  Obstacles obstacle = new Obstacles((int) round(random(50, 450)), 
  (int) round(random(20, 70)));
  gameO.add(obstacle);

  Human person = new Human();
  gameO.add(person);
}

int x, y; 
int gap = 10; 
int  colCount = 0; //counts the number of collisions
int z; 

ArrayList<GameObject> gameO = new ArrayList<GameObject>();
//Human person = new Human();

void drawGrid()
{
  stroke(70);
  for (int i = gap; i <= height; i+= gap)
  {
    line(0, i, height, i);
    line(i, 0, i, width);
  }
}


void draw()
{
  background(0);
  drawGrid();

  //  person.update();
  //  person.render();
  if (frameCount % 60 == 0)
  {
    Obstacles x = new Obstacles((int) round(random(50, 450)), 
    (int) round(random(20, 70)));
    gameO.add(x);
  }
  for (int i = gameO.size () - 1; i >= 0; i--)
  {
    GameObject go = gameO.get(i);
    go.update();
    go.render();
  }


  /*
  if (frameCount % 60 == 0)
   {
   GameObject powerup = new LivesPU();
   
   gameO.add(powerup);
   }
   */
  checkCollision();

  if (colCount == z)
  {
    z += 10;
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
        if (other instanceof Obstacles) 
        {
          if (go.pos.dist(other.pos) < go.rad + other.rad)
          {
            ((Obstacles) other).applyTo((Human)go);
            gameO.remove(other);
          }
        }
      }
    }
  }
}

