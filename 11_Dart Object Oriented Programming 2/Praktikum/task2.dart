import 'dart:io';

void main() {
  FaktorPersekutuanTerbesar fpb = FaktorPersekutuanTerbesar();
  KelipatanPersekutuanTerkecil kpk = KelipatanPersekutuanTerkecil();

  stdout.write('Masukkan Angka Pertama : ');
  fpb.x = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan Angka Kedua : ');
  fpb.y = int.parse(stdin.readLineSync()!);

  print('Berikut Faktor Kepersekutuan Terbesar = ${fpb.hasil(fpb.x, fpb.y)}');
  print('Berikut Kelipatan Persekutuan Terkecil = ${kpk.hasil(fpb.x, fpb.y)}');
}

class Matematika {
  hasil(int angka1, int angka2) {
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x = 0;
  int y = 0;

  @override
  int hasil(int angka1, int angka2) => angka1.gcd(angka2);
  
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x = 0;
  int y = 0;
    
  @override
  int hasil(int angka1, int angka2) => (angka1 * angka2) ~/ fpb(angka1, angka2);
  
  // cara kedua menghitung kpk
  int hitungKpk2(int angka1, int angka2) => ((angka1 ~/ fpb(angka1, angka2)) * angka2).abs();

  int fpb(int angka1, int angka2) {
    return angka1.gcd(angka2);
  }
}