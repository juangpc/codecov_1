
int function1(int a) {
  int b(a);
  switch (a) {
    case 1 : 
      b *= a;
      break;
    case 2 : 
      b += a;
      break;
    case 3 : 
      b -= a;
      break;
    default : 
      b = 100;
  }
  return b;
}