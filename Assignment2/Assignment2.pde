/*
 Caoimhe Harvey
 C14724965
 OOP-Assignment 2
 DT282-2
 */

import processing.sound.*;

SoundFile outofbounds;
SoundFile collision;
SoundFile end;


void setup()
{
  size(500, 700);

  //sound
  outofbounds = new SoundFile(this, "error.wav");
  collision = new SoundFile(this, "swoosh.wav");
  end = new SoundFile(this, "buzzer.wav");

  z = 5;//comparison counter for collisions
  Human person = new Human(260, 500);
  gameO.add(person);

  speed = 1.0f;
  bgap = 0.0f;
  toggled = true;
  endToggled = false;
  obc = 0;
}

// BOOLEANS TO JUMP BETWEEN WINDOWS IN MENU  
boolean toggled; 
boolean endToggled; 
int colCount = 0; //counts the number of collisions which have occured
int z;  //comparison counter for collisions
float bgap; //border width
float speed;
float bw; 
//out of borders counter
int obc; 

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
          - 15, (int) round(random(20, 70)), speed);
        gameO.add(obstacle);
        break;
      case 3:
        GameObject powerup = new LivesPU((int) round(random(bw, width - bw)), -15);   
        gameO.add(powerup);
        break;
      case 4: 
      case 5:
        GameObject collection = new Collect((int) round(random(bw, width - bw)), - 15, random(1.0f, 4.0f));
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


// CHECKING ALL AROUND SCREEN COLLISIONS -----------------------------------------------
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
            } else if (h.pos.x < other.pos.x - 30) {
            } else
            {
              ((Powerup) other).applyTo((Human)h);
              //gameO.play();
              gameO.remove(other);
              colCount++;
              //----PLAY COLLISION NOISE
              collision.play();
              collision.amp(1);
              
              //TO CHECK IF LIVES ARE == 0
              if (((Human) h).lives == 0)
              {
                end.play();
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

        //removing a life each half second spent out of bounds
        if (frameCount % 30 == 0)
        {
          outofbounds.play();
          outofbounds.amp(-0.5);
          ((Human) h).lives --;
          if (((Human) h).lives == 0)
          {
            end.play();
            endToggled =! endToggled;
          }
        }
        //seconds spent out of bounds
        if (frameCount % 60 == 0)
        {
          obc++;
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
  Human you = new Human(160, 245);
  you.render();
  fill(255);
  stroke(255);
  text("This is you", width * 0.45f, 250);

  //what do i dodge
  Obstacles dodge = new Obstacles(140, 280, 40, 0);
  dodge.render();
  fill(255);
  stroke(255);
  text("You avoid these", width * 0.45f, 310);

  //lives
  LivesPU livespowerup = new LivesPU(150, 365);
  livespowerup.render();
  fill(255);
  stroke(255);
  text("These give you more lives", 200, 380);

  //collecting points
  Collect colpoints = new Collect(160, 450, 0.0f);
  colpoints.render();
  fill(255);
  stroke(255);
  text("Collect these to get points", 200, 450);


  //draw rectangles for grass
  noStroke();
  fill(40, 196, 64);
  rect(0, 0, width * 0.15f, height);
  rect(width, 0, - width * 0.15f, height);
  fill(255);
  stroke(255);
  text("<----- If you hit these you're ----->\nout of bounds and lose 1 life ever half\n      second for which you are out", 
    width - 375, height * 0.7f + 20);

  //how do i start
  text("To start press SHIFT", width - 325, height - 100);
}

//-------- In the lines below --------------------------------------------------------------------------------------
// I am aware there is a better way than repeating the for loop in both 
// methods, however, I was unable to figure one out in for the given deadline
void endScreen()
{
  background(138, 0, 0);
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
      text("Total Collisions: " + colCount, 160, 230);
      text("Seconds spent OUT OF BOUNDS: " + obc + "s", 70, 270);
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
      textSize(20);
      text("Points: " + ((Human) h).points, 70, 50);
      text("Collisions: " + colCount, 180, 50);
      text("Lives: " + ((Human) h).lives, 320, 50);
    }
  }
}