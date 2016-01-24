/*
Caoimhe Harvey
 C14724965
 OOP-Assignment 2
 DT282-2
 */


void setup()
{
  size(500, 500);
  z = 10;//counter 
}

int x, y; 
int gap = 10; 
int  colCount = 0; //counts the number of collisions
int z; 

ArrayList<Obstacles> obstacle = new ArrayList<Obstacles>();
GameObject person = new Human();
//GameObject obstacle;

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
  person.update();
  person.render();
 // obstacle.update();
 // obstacle.render();
int c = 4;
if((frameCount % 10) == 0)
{
  obstacle.add(new Obstacles((int) round(random(100,400)), 10));
}
 // checkCollision();
  if (colCount == z)
  {
    //go.s += 1.0f;
    z += 10;
  }
}
/*
void checkCollision()
{
  if (person.pos.x == obstacle.obst.x && person.pos.y == obstacle.obst.y) {
    {
      println("Collision");
      colCount ++;
    }
  }
}
*/

