/*
Caoimhe Harvey
 C14724965
 OOP-Assignment 2
 DT282-2
 */


void setup()
{
  size(500, 700);
  z = 5;//counter for collisions
  Human person = new Human();
  gameO.add(person);
  speed = 1.0f;
  c = color(27, 83, 132);
  bgap = 0.0f;
  toggled = true;
  endToggled = false;
}

boolean toggled; 
boolean endToggled; 
int c; //background color in draw
int x; 
int colCount = 0; //counts the number of collisions
int z; 
float bgap; //border width
float speed;
float bw; 

ArrayList<GameObject> gameO = new ArrayList<GameObject>();


void draw()
{
  //BACKGROUND CODE -------------------------------------------------------------------
  //create lightning and darkening background of blue
  background(c);

  //MENU ------------------------------------------------------------------------------
  //use bool to toggle game play until the end screen is displayed. 
  //if toggled = true then display start screen until SHIFT is pressed
  //when SHIFT is pressed set toggled to false then user plays game
  //when users lives == 0 then display the end screen (use second bool)
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
  } else
  {

    //right side
    fill(40, 196, 64);
    rect(0, 0, bw, height);
    //left
    rect(width, 0, - bw, height);

    bw = width * bgap;

    //FOR EVERY 60 SECOND DISPLAY NEW OBJECT ----------------------------------------------
    if (frameCount % 60 == 0)
    {
      switch((int) random(0, 5))
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
        GameObject collection = new Collect((int) round(random(bw, width - bw)));
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
    checkBorders();
    livesCheck();
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
    /*
    if(gameO.lives == 0)
     {
     endToggled = true;
     }
     */
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
            } else
            {
              ((Powerup) other).applyTo((Human)h);
              gameO.remove(other);
              colCount++;
            }
          }
        }
      }
    }
  }
}

//if human is outside of the boundaries and displays appropiate messages with appropiate action
void checkBorders()
{
  GameObject pers = new Human();
  if (pers.pos.x < width * 0.1f || pers.pos.x > width - (width * 0.1f))
  { 
   // println("OUT OF BOUNDS");
  } else 
  {
    //println("IN BOUNDS");
  }
}

void startScreen()
{
  //title
  textSize(32);
  text("Dodge 'Em", width * 0.35f, height * 0.35f);
  textSize(14);

  //who am i and how do i move
  ellipse(width * 0.35f - 15, height * 0.5f, 20, 20);
  text("This is you", width * 0.45f, height * 0.5f);

  //what do i dodge
  rect(width * 0.3f - 10, height * 0.55f - 10, 40, 40 );
  text("You avoid these", width * 0.45f, height * 0.55f + 20);

  //lives
  float px = width * 0.3f;
  float py = height * 0.6f;
  pushMatrix();
  rect(px, py + 35, 20, 30);
  triangle(px - 15, py + 35, px + 10, py - 20  + 35, px + 35, py  +35);
  popMatrix(); 
  text("These give you more lives", px + 60, py + 35);
  /*
   //collecting points
   pushMatrix();
   popMatrix(); 
   text("These speed you up");
   */

  //draw rectangles for grass
  noStroke();
  fill(40, 196, 64);
  rect(0, 0, width * 0.15f, height);
  rect(width, 0, - width * 0.15f, height);
  text("<----- If you hit these you're\nout of bounds and lose 1 life ----->", 
  width - 375, height * 0.7f + 20);

  //how do i start
  text("To START press SHIFT", width - 325, height - 100);
}

void endScreen()
{
}

void displayGameInfo()
{
  fill(255);
  rect(-2, -2, width + 5, height * 0.1f);
  //add text with details with user stats
  fill(0);
  stroke(0);
  textSize(12);
  text("Lives: " , 100, 30);
  text("Collisions: " + colCount, 100, 50);
  text("Points: ", 200, 30);
}

void livesCheck()
{
  for (int i = gameO.size () - 1; i >= 0; i --)
  {
    GameObject person = new Human();
    if (((Human) person).lives == 0)
    {
      println("dead");
    }
  }
}

