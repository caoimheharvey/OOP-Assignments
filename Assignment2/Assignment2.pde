/*
Caoimhe Harvey
 C14724965
 OOP-Assignment 2
 DT282-2
 */


void setup()
{
  size(500, 700);

  z = 5;//comparison counter for collisions
  Human person = new Human();
  gameO.add(person);

  speed = 1.0f;
  bgap = 0.0f;
  toggled = true;
  endToggled = false;
}

boolean toggled; 
boolean endToggled; 
int colCount = 0; //counts the number of collisions which have occured
int z;  //comparison counter for collisions
float bgap; //border width
float speed;
float bw; 

ArrayList<GameObject> gameO = new ArrayList<GameObject>();


void draw()
{
  //BACKGROUND CODE -------------------------------------------------------------------
  background(0, 100, 150);

  //MENU ------------------------------------------------------------------------------
  if (toggled)
  {
    startScreen();
    if (keyPressed)
    {
      if (key == CODED)
      {
        if (keyCode == SHIFT) 
        {
          toggled =! toggled;
        }
      }
    }
  } else if (endToggled == false)
  {
    //right side
    noStroke();
    fill(40, 196, 64);
    rect(0, 0, bw, height);
    //left
    rect(width, 0, - bw, height);

    bw = width * bgap;

    //FOR EVERY 60 SECOND DISPLAY NEW OBJECT ----------------------------------------------
    if (frameCount % 60 == 0)
    {
      switch((int) random(0, 6))
      {
      case 0:
      case 1:
      case 2:
        Obstacles obstacle = new Obstacles((int) round(random(bw, width - bw - 70)), 
        (int) round(random(20, 70)), speed);
        gameO.add(obstacle);
        break;
      case 3:
        GameObject powerup = new LivesPU((int) round(random(bw, width - bw)));   
        gameO.add(powerup);
        break;
      case 4: 
      case 5:
        GameObject collection = new Collect((int) round(random(bw, width - bw)), speed);
        gameO.add(collection);
      }
    }
    //DISPLAYING THE GAME --------------------------------------------------------------
    for (int i = gameO.size () - 1; i >= 0; i--)
    {
      GameObject go = gameO.get(i);
      go.update();
      go.render();
    } 
    displayGameInfo();
    //COLLISION RELATED CODE ---------------------------------------------------------
    checkCollision();

    //incrementing border size
    if (colCount == z)
    {
      z += 10;
      speed += 0.5f;
      if (bgap <= 0.2f)
      {
        bgap += 0.05f;
      }
    }
  }
  if (endToggled)
  {
    endScreen();
  }
}



void checkCollision()
{
  for (int i = gameO.size () - 1; i >= 0; i --)
  {
    GameObject h = gameO.get(i);
    if (h instanceof Human)
    {
      for (int j = gameO.size () - 1; j >= 0; j --)
      {
        GameObject other = gameO.get(j);
        if (other instanceof Powerup) 
        {
          if (h.pos.dist(other.pos) < h.rad + other.rad)
          {
            if (other.pos.y > 510) {
            } else if (h.pos.x + 10 < other.pos.x ) {
            } else
            {
              ((Powerup) other).applyTo((Human)h);
              gameO.remove(other);
              colCount++;
              //TO CHECK IF LIVES ARE == 0
              if (((Human) h).lives == 0)
              {
                endToggled =! endToggled;
              }
            }
          }
        }
      }
      //CODE TO CHECK BORDER COLLISION
      if (h.pos.x > width - bw || h.pos.x < bw)
      {
        textSize(42);
        fill(255, 0, 0);
        text("OUT OF BOUNDS", 90, height / 2);

        //removing a life each second spent out of bounds
        if (frameCount % 60 == 0)
        {
          ((Human) h).lives --;
          if (((Human) h).lives == 0)
          {
            endToggled =! endToggled;
          }
        }
      }
    }
  }
}


void startScreen()
{
  //title
  textSize(32);
  text("Dodge 'Em", width * 0.35f, 150);
  textSize(14);

  //who am i and how do i move
  fill(255);
  stroke(0);
  ellipse(width * 0.35f - 15, 245, 20, 20);
  fill(255);
  stroke(255);
  text("This is you", width * 0.45f, 250);

  //what do i dodge
  stroke(255, 0, 0);
  fill(70);
  rect(width * 0.3f - 10, 280, 40, 40 );
  fill(255);
  stroke(255);
  text("You avoid these", width * 0.45f, 310);

  //lives
  noStroke();
  fill(255, 253, 93);
  float px = width * 0.3f;
  float py = 340;
  pushMatrix();
  rect(px, py + 35, 20, 30);
  triangle(px - 15, py + 35, px + 10, py - 20  + 35, px + 35, py  +35);
  popMatrix(); 
  fill(255);
  stroke(255);
  text("These give you more lives", px + 60, 380);

  //collecting points
  fill(102, 255, 255);
  stroke(102, 255, 255);
  pushMatrix();
  float lastX = px; 
  float lastY = 450;
  int sides = 5;
  float thetaInc = TWO_PI / sides;
  for (int i = 0; i <= sides; i ++)
  {
    float t = i * thetaInc;
    float x = sin(t) * 20;
    float y = -cos(t) * 20;
    line(lastX, lastY, x, y);
    lastX = x;
    lastY = y;
  }
  popMatrix(); 

  fill(255);
  stroke(255);
  text("Collect these to get points", px + 60, 450);


  //draw rectangles for grass
  noStroke();
  fill(40, 196, 64);
  rect(0, 0, width * 0.15f, height);
  rect(width, 0, - width * 0.15f, height);
  fill(255);
  stroke(255);
  text("<----- If you hit these you're ----->\n      out of bounds and lose 1 life", 
  width - 375, height * 0.7f + 20);

  //how do i start
  text("To START press SHIFT", width - 325, height - 100);
}

//-------- In the lines below ----------------------------------------------------------------
// I am aware there is probably a better way than repeating the for loop in both 
// methods, however, I was unable to figure one out in the time given
void endScreen()
{
  for (int i = gameO.size () - 1; i >= 0; i --)
  {
    GameObject h = gameO.get(i);
    if (h instanceof Human)
    {
      textSize(26);
      fill(255);
      stroke(255);
      text("End Score: " + ((Human) h).points, width * 0.35f, 150);
      textSize(20);
      text("Thanks for playing", 150, height / 2);
    }
  }
}

void displayGameInfo()
{
  for (int i = gameO.size () - 1; i >= 0; i --)
  {
    GameObject h = gameO.get(i);
    if (h instanceof Human)
    {
      fill(255);
      rect(-2, -2, width + 5, height * 0.1f);
      //add text with details with user stats
      fill(0);
      stroke(0);
      textSize(12);
      text("Points: " + ((Human) h).points, 100, 30);
      text("Collisions: " + colCount, 100, 50);
      text("Lives: " + ((Human) h).lives, 200, 30);
    }
  }
}
