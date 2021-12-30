#define BAR(x) ((x) || (x)) 

template <typename T>
void foo(T x) {
  for (unsigned i = 0; i < 10; ++i) {
    BAR(i);
  }
}

