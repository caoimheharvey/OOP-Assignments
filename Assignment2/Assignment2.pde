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

ArrayList<GameObject> go = new ArrayList<GameObject>();
Human person = new Human();
Obstacles obstacle;

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
  //obstacle.update();
  //obstacle.render();


 println("before");
  if ((frameCount % 5) == 0)
  {
    println("IN");
    obstacle = new Obstacles((int) round(random(100, 400)));
    go.add(obstacle);
    println("IN_LADER");
  }
  println("after");
  
  
  for (int i = go.size () - 1; i >= 0; i--)
  {
    GameObject gameO = obstacle.get(i);
    gameO.update();
    gameO.render();
  }

  // checkCollision();
  /*if (colCount == z)
   {
   z += 10;
   }*/
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
