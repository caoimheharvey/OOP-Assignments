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
  grid_space = 20;
}

int grid_space;
int x = (int) random(0, width);
int y = (int) random(0, height);

void draw()
{
  background(0);

  //make grid
  stroke(50);
  for (int i = grid_space; i <= width - grid_space; i += grid_space)
  {
    line(0, i, height, i);
    line(i, 0, i, width);
  }
  stroke(255);
  
  
}

