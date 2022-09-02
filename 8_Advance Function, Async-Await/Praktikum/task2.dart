import 'dart:math';

Random randnum = new Random();

void main() {
  List<List<int>> list1 = [];
  Map<int, List<int>> mapList = {};

  for (int i = 0; i < 5; i++) {
    List<int> list2 = [];
    int randElement1 = randnum.nextInt(10 - 1) + 1;
    int randElement2 = randnum.nextInt(10 - 1) + 1;
    list2.add(randElement1);
    list2.add(randElement2);
    list1.add(list2);
  }
  print('List   : \n$list1 \n');
  mapList = list1.asMap();
  print('Map :');
  mapList.forEach((key, value) => print('Data index ke $key : $value'));
}

