#include <iostream>
#include "foo.cpp"
#include "func1.cpp"

int main(int argc, char* argv[]) {
  std::cout << "\nApplication running!!\n\n";
  
  foo<int>(0);
  foo<float>(0);
  foo<int>(1);
  
  function1(1);
  function1(2);
  function1(3);
  function1(0);
  
  return 0;
}

