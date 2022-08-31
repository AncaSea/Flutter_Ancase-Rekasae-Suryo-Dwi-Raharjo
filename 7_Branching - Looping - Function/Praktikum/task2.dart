void main() {
  hitungFaktorisasi(10);
  hitungFaktorisasi(20);
  hitungFaktorisasi(30);
}

void hitungFaktorisasi (int nilai) {
  double faktorial = 1;
  for (int i = 1; i <= nilai; i++) {
    faktorial *= i;
  }
  print("Hasil faktorial dari " +
      nilai.toString() +
      " adalah " +
      faktorial.toString());
}