abstract class GameObject
{
  boolean continues = true; 
  PVector forward; 
  int angle;
  
  GameObject()
  {
    forward = new PVector(0, -1);
  }
  
  abstract void render();
  
  abstract void update();
}
