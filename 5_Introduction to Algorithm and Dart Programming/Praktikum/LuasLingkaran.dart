import 'dart:math';

void main() {
  Random randnum = new Random();
  int jari = randnum.nextInt(100);

  print('Jari-jari lingkaran adalah $jari');
  LuasLingkaran(jari);
}

void LuasLingkaran (int r) {
  double phi = 3.14;
  double hitungLuas = phi * r * r;

  print("Luas Lingkaran adalah $hitungLuas");
}