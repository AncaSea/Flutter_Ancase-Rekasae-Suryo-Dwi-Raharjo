import 'dart:math';

void main() {
  Random randnum = new Random();

  int angka = randnum.nextInt(100 + 100) - 100;

  print(nilai(angka));
}

String nilai (int angka) {
    if (angka > 70) {
      return '$angka = A';
    } else if (angka > 40) {
      return '$angka = B';
    } else if (angka > 0) {
      return '$angka = C';
    } else {
      return '$angka = kosong';
    }
}