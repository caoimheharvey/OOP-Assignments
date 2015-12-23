abstract class GameObject
{
  PVector pos;
  PVector forward;
  float theta;
  
  GameObject()
  {
  }
  
  GameObject(float x, float y)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.theta = 0.0f;
  }
  
  abstract void update();
  abstract void render();
}
