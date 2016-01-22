abstract class GameObject
{
  boolean continues = true; 
  PVector forward; 
  
  GameObject()
  {
    forward = new PVector(1, 0);
  }
  
  abstract void render();
  
  abstract void update();
}
