class dataDiri {
  String _nama;
  String umur;
  String asal;
  String? hobi;
  String makanFav;
  List<String> filmFav;

  dataDiri(this._nama, this.umur, this.asal, this.makanFav, this.filmFav);
  String get nama => _nama;
  set nama(String nama) {
    this._nama = nama;
  }
}

class kampus {
  String? nama;  
  String? lokasi;  
  List<String>? jurusan;  
  String? namaRektor;  
  bool? isptn;  
}

void main() {
  // dataDiri Ancase = dataDiri('Ancase', '21', 'Klaten', 'borgar', ['Transformer', 'One Piece']);
  // print(Ancase.makanFav);
  // Ancase.makanFav = 'Mie Goreng';
  // print(Ancase.makanFav);

  // Ancase.filmFav[0] = 'AOT';
  // print(Ancase.filmFav);

  // Ancase._nama = 'Adit';
  // print(Ancase._nama);

  kampus k1 = kampus();
  k1.nama = 'a';
  k1.lokasi = 'b';
}