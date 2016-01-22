abstract class GameObject
{
  boolean continues = true; 
  PVector forward; 
  //speed for obstacles
  float s;
  
  GameObject()
  {
    s = 0.5f;
    forward = new PVector(0, s);
  }
  
  abstract void render();
  
  abstract void update();
}
