// Gestalten mit Code - day 02 - beginner lectures

/**
 * basic structure of a processing program;
 * what are types and what are functions;
 * execution order of the program;
 * how are variables scoped;
 *
 */


int hello;

void setup() {
  int a = add(10, 10);
  println(a);
  int b = minus(a, 10);
  println(b);
  int c = square(5);
  println(c);
  
  hey(100, 100);
  println(hello);
}

// function takes two parameters (a&b) and returns a result
int add(int a, int b) {
  int c = a + b;
  return c;
}

// see above
int minus(int a, int b) {
  return a - b;
}

// see above
int square(int a) {
  return a * a;
}

// function takes two parameters but returns nothing,
// instead the functions producing a 'sideeffect' by 
// changing the value of the 'hello' variable 
void hey(int a, int b) {
  hello = a + b + a + b; 
}