import 'dart:io';

void main() {
  mobil mbl = new mobil();
  bool answer = true;

  do {
    print('----------------------');
    print('Masukkan Nama Hewan : ');
    String name = stdin.readLineSync()!;

    print('Masukkan Berat Hewan : ');
    int berat = int.parse(stdin.readLineSync()!);

    mbl.tambahMuatan(name, berat);
    print('----------------------');
    print('List muatan hewan ${mbl.muatan}');
    print('List berat hewan ${hewan.beratHewans}');
    print('Sisa kapasitas sekarang ${mbl.kapasitas}');
    print('Total muatan hewan ${mbl.totalMuatan()}');
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
  static List<int> beratHewans = [];
}

class mobil {
  int kapasitas = 10;
  List<String> muatan = [];

  int tambahMuatan(String namaHewan, int beratBadan) {
    
    if (beratBadan <= kapasitas && kapasitas != 0) {
      muatan.add(namaHewan);
      hewan.beratHewans.add(beratBadan);
      kapasitas -= beratBadan;
    } else {
      print('------------------------');
      print('Muatan sudah memenuhi kapasitas mobil');
    }
    return 0;
  }

  int totalMuatan() {
    int muatanTotal = 0;
      for (int muatanHitung in hewan.beratHewans) {
        muatanTotal += muatanHitung;
      }
    return muatanTotal;
  }
}