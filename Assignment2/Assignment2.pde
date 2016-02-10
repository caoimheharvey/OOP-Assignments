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
SoundFile obst;

void setup()
{
  size(500, 700);

  //SOUND EFFECTS  -------------------------------------------------------------------
  outofbounds = new SoundFile(this, "error.wav");
  collision = new SoundFile(this, "swoosh.wav");
  end = new SoundFile(this, "buzzer.wav");
  obst = new SoundFile(this, "beep.wav");

  z = 5;//comparison counter for collisions
  Human person = new Human(260, 500);
  gameO.add(person);

  speed = 1.0f;
  bgap = 0.0f;
  toggled = true;
  endToggled = false;
  obc = 0;
}

// GLOBAL VARIABLES -------------------------------------------------------------------
//Used to jump between screens 
boolean toggled; 
boolean endToggled; 

//Counters for collisions
int colCount = 0; 
int pucount = 0; //counter for non-obstacle powerup collisions
int z;  //comparison counter for collisions

//Border related fields
float bgap; //percentage by which it increases each time
float bw;  //border width

//Out of Bounds Counter
int obc; 

//Speed of Falling Obstacles
float speed;

//ArrayList of all components under Game Object
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
    // CREATING GRASS BORDERS ------------------------------------------------------------
    bw = width * bgap;
    noStroke();
    fill(40, 196, 64);
    rect(0, 0, bw, height);
    rect(width, 0, - bw, height);

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
    
    //for every 10 powerups collected the border gets bigger
    //incrementing border size
    if (pucount == z)
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
        if (other instanceof FallingObjects) 
        {
          if (h.pos.dist(other.pos) < h.rad + other.rad)
          {
            if (other.pos.y > 510) {
            } else if (h.pos.x < other.pos.x - 30) {
            } else
            {
              ((FallingObjects) other).applyTo((Human)h);
              colCount++;
              gameO.remove(other);

              if (other instanceof Obstacles)
              {
                //PLAY COLLISION NOISE
                obst.amp(-0.7);
                obst.play();
              } else
              {
                //PLAY COLLISION NOISE
                collision.play();
                collision.amp(1.5);
                pucount++;
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
        }
        //seconds spent out of bounds
        if (frameCount % 60 == 0)
        {
          obc++;
        }
      }
      //TO CHECK IF HUMAN IS STILL ALIVE OR NOT
      if (((Human) h).lives == 0)
      {
        end.play();
        endToggled =! endToggled;
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
  Human you = new Human(160, 215);
  you.render();
  fill(255);
  stroke(255);
  text("This is you", width * 0.45f, 215);

  //what do i dodge
  Obstacles dodge = new Obstacles(140, 250, 40, 0);
  dodge.render();
  fill(255);
  stroke(255);
  text("You avoid these", width * 0.45f, 280);

  //lives
  LivesPU livespowerup = new LivesPU(150, 325);
  livespowerup.render();
  fill(255);
  stroke(255);
  text("These give you more lives", 200, 340);

  //collecting points
  Collect colpoints = new Collect(160, 400, 0.0f);
  colpoints.render();
  fill(255);
  stroke(255);
  text("Collect these to get points", 200, 400);


  //moving 
  text("<  To move use the L and R arrow keys  >", 110, 460);

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
      text("If you wish to play again press the UP arrow", 35, 330);
      text("Thanks for playing", 150, height - 200);
  
    //PLAYING AGAIN
      if (keyPressed)
      {
        if (key == CODED)
        {
          if (keyCode == UP) 
          {
            endToggled = !endToggled;
            toggled =! toggled;
            ((Human) h).lives = 5;
            ((Human) h).points = 0;
            colCount = 0;
            z = 5; 
            bgap = 0.0f;
            speed = 1.0f;
          }
        }
      }
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
      //text with details of user stats
      fill(0);
      stroke(0);
      textSize(20);
      text("Points: " + ((Human) h).points, 70, 50);
      text("Collisions: " + colCount, 180, 50);
      text("Lives: " + ((Human) h).lives, 320, 50);
    }
  }
}