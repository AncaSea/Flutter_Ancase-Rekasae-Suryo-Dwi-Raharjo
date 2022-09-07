void main(List<String> args) {
  Map<String, String> dataDiri = {};

  List<String> hobbies = [
    'Main Bola',
    'Gambar',
    'Nyanyi',
    'Sulap',
    'Olahraga',
    'Badminton',
    'Berenang'
  ];

  List<String> names = [
    'Jaka',
    'Jiki',
    'Juku',
    'Jeke',
    'Joko',
    'Paimin',
    'Nico'
  ];

  for (var i = 0; i < names.length; i++) {
    dataDiri[names[i]] = hobbies[i];
  }

  Map<String, String> map = Map.fromIterables(names, hobbies);

  print(dataDiri);
  print(map);
}
