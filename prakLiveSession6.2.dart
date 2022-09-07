List<Map<String, dynamic>> dataDiri = [
  {"Nama": "Ade", "Umur": 21},
  {"Nama": "Adit", "Umur": 22},
  {"Nama": "Vivo", "Umur": 23},
  {"Nama": "Oppo", "Umur": 24},
];
void main() {

  print(dataDiri);
  dataDiri.remove(dataDiri.last);
  print(dataDiri);

  // Map<String, dynamic> upData = dataDiri[1];
  dataDiri[2].update("Umur", (int) => '20');
  print(dataDiri);

  dataDiri.forEach((element) => print(element.values.elementAt(0)));

  // for (Map<String, dynamic> map in dataDiri) {
  //   print(map);
  //   map.entries.forEach((element) {print(element.value);});
  // }
}
