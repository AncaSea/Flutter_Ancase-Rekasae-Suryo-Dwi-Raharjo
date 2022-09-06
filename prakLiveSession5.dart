/*
ada 6 orang: adit, ade, agung, akbar, yusril, mahendra

1: print setiap nama diatas kecuali ade
2: print semua nama diatas & berhenti ketika ada nama akbar
*/

void main() {
  List<String> names = ['adit', 'ade', 'agung', 'akbar', 'yusril', 'mahendra'];

  List<String> reverseNames = names.reversed.toList();

  var a = bangun();
  print(a);
  // print(dataNama(names));
  // print(dataNama(reverseNames));

  //   for (String name in names) {
  //   if (name == 'ade') {
  //     continue;
  //   } else if (name == 'akbar') {
  //     break;
  //   } else {
  //     print(name);
  //   }
  // }
}

String dataNama (List<String> inputName) {
  // String name = '';
  for (String name in inputName) {
    if (name == 'ade') {
      continue;
    } else if (name == 'akbar') {
      break;
    } else {
      print(name);
    }
  }
  return '';
}

class bangun {
  
}