/*
Caoimhe Harvey
 C14724965
 OOP-Assignment 2
 DT282-2
 */

//snake game
void setup()
{
  size(500, 500);
  sx = width / 2 + 10;
  sy = height / 2 + 10;
}

int sx, sy; 
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
  rect(sx, sy, 20, 20);
}

