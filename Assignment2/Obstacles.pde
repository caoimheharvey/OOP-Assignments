class Obstacles extends GameObject implements FallingObjects
{
  int w;

  Obstacles(int x, int y ,int w, float s)
  {
    this.w = w;
    rad = w;
    pos = new PVector(x, y);
    forward = new PVector(0, s);
  }

  void applyTo(Human person)
  {
    person.lives --;
  }

  void render()
  {
    //noStroke();
    stroke(255,0,0);
    fill(70);
    pushMatrix();
    rect(pos.x, pos.y, w, w, 5);
    popMatrix();
  }

  void update()
  {
    pos.add(forward);
  }
}