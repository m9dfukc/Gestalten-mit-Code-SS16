void setup() {
  long factorial = factorialLoop(4); // try a large number and see what happens
  println(factorial);
}

// Definition of factorial:
// The factorial of any number n, usually written as n!, is defined as:
// n! = n * n – 1 * . . . . * 3 * 2 * 1

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