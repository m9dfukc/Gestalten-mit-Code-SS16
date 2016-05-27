// Gestalten mit Code - day 04 - beginner lectures

/**
 * factorial numbers (https://en.wikipedia.org/wiki/Factorial)
 * http://www.bogotobogo.com/cplusplus/images/quiz/recursion_factorial.png
 * 
 * Definition of factorial
 * The factorial of any number n, usually written as n!,
 * is defined as: n! = n * n – 1 * . . . . * 3 * 2 * 1
 */

void setup() {
  // factorial computing using classical loops
  long factorial = factorialLoop(4); 
  println(factorial);
  
  // factorial computing using recursion
  long factorial2 = factorialRecursion(4);
  println(factorial2);
}

// Using a regular loop to compute factorial
int factorialLoop(int n) {
  int f = 1;
  for (int i = 0; i < n; i++) {
    f = f * (i+1);
  }
  return f;
}

// Using recursion to compute factorial
int factorialRecursion(int n) {
  if (n == 1) {
    return 1;
  } else {
    return n * factorialRecursion(n-1);
  }
}