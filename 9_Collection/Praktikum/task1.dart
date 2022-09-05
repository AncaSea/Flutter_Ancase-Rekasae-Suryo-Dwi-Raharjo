import 'dart:math';

Random randnum = new Random();

void main() async {
  print('Berikut Hasil Perkalian :');
  await forAddList(5);
  finish();
}

Function finish = () => print('Selesai');

Function forAddList = (int listLength) async {
  List<int> listNum = [];
  int numPengali = randnum.nextInt(10) + 1;

  for (int i = 1; i <= listLength; i++) {
    listNum.add(randnum.nextInt(10) + 1);
  }
  print('List = ${listNum}');
  await dataNum(listNum, numPengali);
};

Future<int> dataNum (List<int> number, int pengali) async {
  print('Nilai Pengali = $pengali');
  await Future.delayed(Duration(seconds: 2), () {
    for (int hasil in number) {
      int randList = randnum.nextInt(number.length);
      int numRandList = number[randList];
      hasil = numRandList * pengali;
      print('Hasil Perkalian index ke $randList adalah $numRandList x $pengali = $hasil');
    }
  });
  return 0;
}