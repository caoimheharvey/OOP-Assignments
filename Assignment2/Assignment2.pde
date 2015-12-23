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
  gap = 20;
}

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
  
  
}

