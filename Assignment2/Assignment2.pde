/*
Caoimhe Harvey
 C14724965
 OOP-Assignment 2
 DT282-2
 */

//snake game
Snake snakes = new Snake();

void setup()
{
  size(500, 500);
  startx = width / 2 + 10;
  starty = height / 2 + 10;
}

int startx, starty; 
int gap = 20; 

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
  //rect(startx, starty, 20, 20);
  snakes.update();
  snakes.render();
}

