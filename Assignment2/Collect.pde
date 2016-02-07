class Collect extends GameObject implements Powerup
{
  float theta; 
  float thetaInc; 
  float thetaDir;

  Collect(int x, int y, float s)
  {
    this.s = s;
    s = 2.0f; 
    pos = new PVector(x, y);
    forward = new PVector(0, s);
    thetaDir = random(-0.2f, 0.2f);
    theta = 0.0f;
    rad = 20;
  }

  void applyTo(Human person)
  {
    person.points++;
  }

  void render()
  {
    stroke(102, 255, 255);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    float lastX = 0; 
    float lastY = - 5;
    int sides = 5;
    float thetaInc = TWO_PI / sides;
    for (int i = 0; i <= sides; i ++)
    {
      float t = i * thetaInc;
      float x = sin(t) * rad;
      float y = -cos(t) * rad;
      line(lastX, lastY, x, y);
      lastX = x;
      lastY = y;
    }
    popMatrix();
  }

  void update()
  {
    theta += thetaDir;
    pos.add(forward);
  }
}

