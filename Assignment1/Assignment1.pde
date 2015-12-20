/*
 Caoimhe Harvey
 C14724965
 
 Computer Science International DT282-2
 
 Object Oriented Programming - Assignment 1
 */
ArrayList<MSstock> msft = new ArrayList<MSstock>();
ArrayList<APLstock> aapl = new ArrayList<APLstock>();
ArrayList<ORCstock> orcl = new ArrayList<ORCstock>();

void setup() 
{
  size(700, 700, P3D);
  loadData();

  border = width * 0.1f;
  toggled = false;

  minVals[0] = findMin(msft);
  minVals[1] = findMin(aapl);
  minVals[2] = findMin(orcl);

  maxVals[0] = findMax(msft);
  maxVals[1] = findMax(aapl);
  maxVals[2] = findMax(orcl);
}

void draw()
{
  background(100);
  fill(255);
  textSize(12);
  text("0: All graphs", 30, height - (border * 0.5f));
  text("1: Microsoft", 110, height - (border * 0.5f));
  text("2: Apple", 200, height - (border * 0.5f));
  text("3: Oracle", 280, height - (border * 0.5f));
  text("To change format of graphs 1-3 \n click your mouse", 370, height - (border * 0.5f));
  text("5: Read Me", 600, height - (border * 0.5f));

  showGraphs();
}

void loadData()
{
  String[] lines = loadStrings("microsoft.csv");
  String[] lines1 = loadStrings("apple.csv");
  String[] lines2 = loadStrings("oracle.csv");

  for (int i = 0; i < lines.length; i++)
  {
    MSstock msstock = new MSstock(lines[i]);
    msft.add(msstock);

    APLstock aplstock = new APLstock(lines1[i]);
    aapl.add(aplstock);

    ORCstock orcstock = new ORCstock(lines2[i]);
    orcl.add(orcstock);
  }
}

float findMin(ArrayList data)
{
  float min = ((Stock) data.get(0)).price;
  for (int i = 1; i < data.size (); i++)
  {
    if (((Stock) data.get(i)).price < min)
    {
      min = ((Stock) data.get(i)).price;
    }
  }
  return min;
}

float findMax(ArrayList data)
{
  float max = ((Stock) data.get(0)).price;
  for (int i = 1; i < data.size (); i++)
  {
    if (((Stock) data.get(i)).price > max)
    {
      max = ((Stock) data.get(i)).price;
    }
  }
  return max;
}

float[] minVals = new float[3];
float[] maxVals = new float[3];
float[] averages = new float[3];
float border;
boolean[] keys = new boolean[512];
boolean toggled; 

void drawAxis()
{
  stroke(255);  
  line(border - 5, height - border, width - border, height - border);
  line(border, border, border, height - border + 5);
}


void drawGraph(ArrayList data, float min, float max)
{
  float x1, y1, x2, y2;
  for (int i = 1; i < data.size (); i ++)
  { 
    x1 = map(i - 1, 0, data.size() - 1, width - border, border);
    y1 = map(((Stock) data.get(i - 1)).price, min, max, height - border, border);
    x2 = map(i, 0, data.size() - 1, width - border, border);
    y2 = map(((Stock) data.get(i)).price, min, max, height - border, border);
    fill(255, 0, 0);
    line(x1, y1, x2, y2);



    if (mouseX >= x2 && mouseX <= x1)
    {      
      stroke(0); 
      fill(0);
      line(x1, border, x1, height - border);
      ellipse(x1, y1, 7, 7);  
      stroke(255);

      fill(255);
      textSize(12);
      text("Date: " + ((Stock) data.get(i - 1)).date, x1 + 10, y1);
      text("Closing($): " + ((Stock) data.get(i - 1)).price, x1 + 10, y1 + 15);
    }
  }
}


void showGraphs()
{
  keys[keyCode] = true;
  if (keys['0'])
  {
    drawAxis();
    stroke(255, 255, 0);
    drawGraph(msft, min(minVals), max(maxVals));
    stroke(255, 142, 101);
    drawGraph(aapl, min(minVals), max(maxVals));
    stroke(0, 225, 230);
    drawGraph(orcl, min(minVals), max(maxVals));

    fill(255); 
    textSize(14);
    text("Microsoft, Oracle, Apple", width * 0.4f, border * 0.5f);
  }
  if (keys['1'])
  {
    if (toggled)
    {
      background(100);
      fill(255);
      textSize(14);
      text("Microsoft", width * 0.5f - 20, border * 0.5f);
      drawLines(msft, minVals[0], maxVals[0]);
    } else
    {
      fill(255);
      textSize(14);
      text("Microsoft", width * 0.5f - 20, border * 0.5f);
      drawAxis();
      stroke(255, 255, 0);
      drawGraph(msft, minVals[0], maxVals[0]);
    }
  }
  if (keys['2'])
  {    
    if (toggled)
    {
      background(100);
      fill(255);
      textSize(14);
      text("Apple", width * 0.5f - 20, border * 0.5f);
      drawLines(aapl, minVals[1], maxVals[1]);
    } else
    {
      fill(255);
      textSize(14);
      text("Apple", width * 0.5f - 20, border * 0.5f);
      drawAxis();
      stroke(255, 142, 101);
      drawGraph(aapl, minVals[1], maxVals[1]);
    }
  }
  if (keys['3'])
  {
    if (toggled)
    {
      background(100);
      fill(255);
      textSize(14);
      text("Oracle", width * 0.5f - 20, border * 0.5f);
      drawLines(orcl, minVals[2], maxVals[2]);
    } else
    {
      fill(255);
      textSize(14);
      text("Oracle", width * 0.5f - 20, border * 0.5f);
      drawAxis();
      stroke(0, 225, 230);
      drawGraph(orcl, minVals[2], maxVals[2]);
    }
  }
  if (keys['5'])
  {
    moreInfo();
  }
  keys[keyCode] = false;
}


void drawLines(ArrayList data, float min, float max)
{
  lights();
  translate(width * 0.5f, height * 0.5f);
  rotateX(1.2);
  rotateZ(map(mouseX, 0, width, 0, TWO_PI));
  for (int i = 0; i < data.size (); i++) 
  {
    float colour = map(((Stock) data.get(i)).price, min, max, 0, 255);
    fill(255, colour, 0);
    float wid = map(((Stock) data.get(i)).price, 0, max, 0, width/2 - 50);
    pushMatrix();
    translate(300, 0);
    box(20, 20, wid);
    popMatrix();
    rotate(TWO_PI/data.size());
  }
}

void moreInfo()
{
  float cx = width * 0.5f;
  float cy = height * 0.5f;
  textSize(20);
  text("Caoimhe Harvey", cx, border);
  text("C14724965", cx, border + 50);
  text("Computer Science International \n DT282 Year 2", cx, border + 100);

  textSize(14);
  text("This program is designed to show different closing stock prices\nfor Oracle, Apple, and Microsoft over a period of 3 months (Aug 21, 2015 - Nov 21, 2015).", border, cy - 100); 
  text("The data is represented in a line graph comparing the 3 graphs,\nthen with user selection the user can view each graph individually.", border, cy );
  text("When the user is in an individual graph and presses and holds the\nmouse, an additional rotating bar graph is displayed along with the each bar's value.", border, cy + 100);
}

void mousePressed()
{
  toggled = !toggled;
}

