/*
Caoimhe Harvey
 C14724965
 OOP-Assignment 2
 DT282-2
 */


void setup()
{
  size(500, 500);
  cx = width / 2;
  cy = height / 2;
}

int cx, cy; 
int gap = 20; 

Human person = new Human(cx, cy);


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
}

