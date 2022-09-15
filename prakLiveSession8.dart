class mahasiswa {
  String nama = '';
  String alamat = '';

  int IPK() {
    return 0;
  }
}

class orangTua extends mahasiswa {
  @override
  String get nama => 'Suryo';
}

class dosenPA extends mahasiswa {

}

void main(List<String> args) {
  orangTua ort = orangTua();

  print(ort.nama);
}