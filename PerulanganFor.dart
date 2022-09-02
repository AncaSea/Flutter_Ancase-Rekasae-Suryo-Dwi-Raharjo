void main() {
  print('Review Dart Funciton');
  // print('4 + 2 = ${add(4, 2)}');
  // sub(5, 2);
  // add(1, 2);
  // sub(3, 1);
  // print(prima(4));
  for (int i = 1; i <= 100; i++) {
    if (prima(i)) {
      print('Bilangan $i adalah bilangan prima');
    }
  }
}

bool prima (int bagi) {
  int count = 0;
  for (int i = 2; i <= 100; i++) {
    if (bagi % i == 0) {
      count++;
    }
    if (count > 1) {
      return false;
    }
  }
  return true;
}

Function add = (int a, int b) => a + b;
// int add(int a, int b) {
//   return a + b;
// }

void sub(int a, int b) {
  print('$a - $b = ${a - b}');
}