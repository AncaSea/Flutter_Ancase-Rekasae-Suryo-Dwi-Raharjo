import 'dart:io';

void main() {
  Kubus bangunK = Kubus();
  Balok bangunB = Balok();

  stdout.write('Masukkan panjang : ');
  int pjg = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan lebar : ');
  int lbr = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan tinggi : ');
  int tg = int.parse(stdin.readLineSync()!);
  stdout.write('Masukkan sisi : ');
  int ss = int.parse(stdin.readLineSync()!);

  print('Berikut hasil hitung volume balok : ${bangunB.volume(pjg, lbr, tg)}');
  print('Berikut hasil hitung volume kubus : ${bangunK.volume(ss, ss, ss)}');
}

class BangunRuang {
  int volume(int p, int l, int t) {
    int panjang = p;
    int lebar = l;
    int tinggi = t;
    int hitungHasil = panjang * lebar * tinggi;
    return hitungHasil;
  }
}

class Kubus extends BangunRuang {

  @override
  int volume(int s1, int s2, int s3) {
    int sisi = s1;
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  @override
  int volume(int p, int l, int t) {
    return super.volume(p, l, t);
  }
}