import 'dart:math';

void main() {
  Random randnum = new Random();
  int jari = randnum.nextInt(100);

  print('Jari-jari lingkaran adalah $jari');
  print(LuasLingkaran(jari));
}

String LuasLingkaran (int r) {
  double phi = 3.14;
  double hitungLuas = phi * r * r;

  return 'Luas Lingkaran ini adalah $hitungLuas';
}