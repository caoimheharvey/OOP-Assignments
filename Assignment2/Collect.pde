class Collect extends GameObject implements Powerup
{
  float theta; 
  float thetaInc; 
  float thetaDir;

  Collect(int x)
  {
    pos = new PVector(x, -15);
    forward = new PVector(0, 2);
    thetaDir = random(-0.2f, 0.2f);
    theta = 0.0f;
  }

  void applyTo(Human person)
  {
    person.points++;
  }

  void render()
  {
    fill(255, 153, 153);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    float lastX = 0; 
    float lastY = - 4;
    int sides = 5;
    float thetaInc = TWO_PI / sides;
    for (int i = 0; i <= sides; i ++)
    {
      float t = i * thetaInc;
      float x = sin(t) * 4;
      float y = -cos(t) * 4;
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

