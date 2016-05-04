/* The very basics of types 
 * -- what are types and why are they there
 * -- "primitive" Types vs. P5 types 
 */

size(200, 200);

// Basic types

int iValue     = 1;
long lValue    = 123;
float fValue   = 1.5;
double dValue  = 1.5000;
boolean bValue = true;
String sValue  = "hello world!";
char cValue    = 'c';

// Processing specific types

// Colors
color color1 = color(100);
color color2 = color(255, 0, 0);
color color3 = color(255, 0, 0, 128);
color color4 = #FF00FF;

// Vector
PVector vector1 = new PVector(width/2, height/2);
PVector vector2 = new PVector(20, 20);

// Images
PImage img1 = loadImage("localImage.png");
PImage img2 = loadImage("https://processing.org/img/processing-web.png", "png");
image(img2, 0, 0);

// Shapes
PShape squareShape;
squareShape = createShape(RECT, width/2, height/2, width/4, height/4);
shape(squareShape, 0, 0);

// Arrays and Lists
int[] numbersArray = new int[3];
numbersArray[0] = 1;
numbersArray[1] = 2;
numbersArray[2] = 3;

ArrayList<Integer> numbersList = new ArrayList<Integer>();
numbersList.add(1);
numbersList.add(2);
numbersList.add(3);