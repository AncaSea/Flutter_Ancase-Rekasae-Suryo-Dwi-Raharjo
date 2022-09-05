import 'dart:math';

Random randnum = new Random();

void main() {
  List<List<int>> list1 = [];
  Map<int, List<int>> mapList1 = {};
  Map<int, int> mapList2 = {};

  for (int i = 0; i < 5; i++) {
    List<int> list2 = [];
    int randElement2 = randnum.nextInt(10 - 1) + 1;
    list2.add(i);
    list2.add(randElement2);
    list1.add(list2);
  }

  print('List   : \n$list1 \n');

  for (List<int> valList2 in list1) {
    mapList2[valList2.elementAt(0)] = valList2.elementAt(1);
  }
  
  mapList1 = list1.asMap();
  print('List didalam Map :');
  print(mapList1);
  mapList1.forEach((key, value) => print('Data index ke $key : $value'));
  print('\nNilai list didalam Map :');
  print(mapList2);
  mapList2.forEach((key, value) => print('Data index ke $key : $value'));
}
