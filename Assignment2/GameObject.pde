abstract class GameObject
{
  PVector pos;
  PVector forward;
  float theta;
  float x, y;

  GameObject()
  {
  }

  GameObject(float x, float y)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.theta = 0.0f;
  }

  void update() {
  }
  void render() {
  }
}

