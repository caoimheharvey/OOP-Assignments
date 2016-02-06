abstract class GameObject
{
  boolean continues = true; 
  PVector forward;
  
  //speed for obstacles
  float s;
  
  PVector pos;
  int rad; 

  GameObject()
  {
  }

  abstract void render();
  abstract void update();
}

