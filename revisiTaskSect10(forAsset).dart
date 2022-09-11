import 'dart:io';

void main() {
  mobil mbl = new mobil();
  hewan hwn = new hewan();
  bool answer = true;

  do {
    print('----------------------');
    print('Masukkan Nama Hewan : ');
    String name = stdin.readLineSync()!;

    print('Masukkan Berat Hewan : ');
    int berat = int.parse(stdin.readLineSync()!);

    mbl.tambahMuatan(name, berat);
    hwn.beratHewans.add(berat);
    print('----------------------');
    print('List muatan hewan ${mbl.muatan}');
    print('List berat hewan ${hwn.beratHewans}');
    print('Sisa kapasitas sekarang ${mbl.kapasitas}');
    print('Total muatan hewan ${mbl.totalMuatan(hwn.beratHewans)}');
    print('----------------------');
    String inputAnswer = '';
    do {
      print('Continue?(y/n) ');
      inputAnswer = stdin.readLineSync()!;

      if (inputAnswer == 'y') {
        answer = true;
      } else if (inputAnswer == 'n') {
        exit(0);
      } else {
        print('------------------------');
        print('Answer is not recognized');
        print('------------------------');
      }
    } while (inputAnswer != 'y');
  } while (answer == true);
}

class hewan {
  List<int> beratHewans = [];
}

class mobil {
  int kapasitas = 50;
  List<String> muatan = [];
  hewan hwn = new hewan();

  void tambahMuatan(String namaHewan, int beratBadan) {
    if (beratBadan <= kapasitas && kapasitas != 0) {
      muatan.add(namaHewan);
      // hwn.beratHewans.add(beratBadan);
      kapasitas -= beratBadan;
    } else {
      print('------------------------');
      print('Muatan sudah memenuhi kapasitas mobil');
    }
  }

  int totalMuatan(List<int> berat) {
    int muatanTotal = 0;
    for (int muatanHitung in berat) {
      muatanTotal += muatanHitung;
    }
    return muatanTotal;
  }
}
