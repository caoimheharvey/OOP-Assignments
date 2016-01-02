/*
Caoimhe Harvey
 C14724965
 OOP-Assignment 2
 DT282-2
 */

//snake game
void setup()
{
  size(700, 700);
  Snake snakes = new Snake('I', 'J', 'K', 'L', width / 2, height / 2);
  go.add(snakes);
  gap = 20;
  x = width * 0.5f;
  y = height * 0.5f;
}

ArrayList<GameObject> go = new ArrayList<GameObject>();
boolean[] keys = new boolean[512];
float x, y;


int gap;

void draw()
{
  background(0);

  //make grid
  stroke(50);
  for (int i = gap; i <= width - gap; i += gap)
  {
    line(0, i, height, i);
    line(i, 0, i, width);
  }
  stroke(255);
  rect(x + 10, y - 10, 20, 20);
 // go.render();
 // go.update();
}


