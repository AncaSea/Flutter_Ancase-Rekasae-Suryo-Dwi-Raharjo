# Section 8 : Advance Function, Async-Await

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## Summary

### **Fungsi (Lanjutan)**

>Di fungsi lanjutan ini ada yang namanya Anonymous Function atau fungsi yang tidak memiliki nama dan untuk menyimpan data 

Berikut adalah dua cara penulisan anonymous function :
```cs
var hello = () { // menggunakan variabel
  print('hello'); // memerlukan print untuk output
};

var jumlah = (int a, int b) { // dapat dimasukkan parameter
  return a + b; // memakai return untuk output fungsi
};

void main() {
  hello(); // cara memanggil fungsi hello
  print(jumlah(1, 2)); // cara memanggil fungsi jumlah
};
```
>Selanjutnya ada Arrow Function, sama seperti anonymous function tidak memiliki nama tapi bisa diberikan nama. Lalu hanya berisi 1 data dari proses maupun data statis dan nilai return atau output diambil dari data tersebut.

Berikut adalah dua cara penulisan arrow function :
```cs
var hello = () => print('hello'); // memakai print untuk output

var jumlah = (int a, int b) => a + b; // tidak memerlukan perintah output tapi harus ada satu proses yang menghasilkan output

void main() {
  hello(); // cara memanggil fungsi hello
  print(jumlah(1, 2)); // cara memanggil fungsi jumlah
};
```

---

### **Async-Await**

>Async-Await merupakan keyword untuk menjalankan beberapa proses tanpa perlu menunggu. Async-Await juga di tulis dalam bentuk fungsi, dan jika di tulis dalam bentuk keyword Await akan menunggu hingga proses async selesai.

Bentuk contoh untuk simulasi Async-Await sebagai berikut :
```cs
void P1 () { // menggunakan variabel
  Future.delayed(Duration(seconds: 1), () { // tipe data Future untuk melakukan delayed selama 1 detik
    print('hello dari P1'); // memerlukan print untuk output
  });
};

void P2 () { // menggunakan variabel
    print('hello dari P2'); // memerlukan print untuk output
};

void main() {
  P1(); // P1 satu dijalankan setelah menunggu 1 detik
  P2(); // P2 akan langsung dieksekusi tanpa menunggu
};
```

Selanjut nya jika ditambahkan keyword Async-Await dengan tipe data Future :
```cs
Future<void> P1 () async { // mengganti tipe data void dengan object Future dan ditambahkan keyword Async untuk inisiasi
  await Future.delayed(Duration(seconds: 1), () { // ditambahkan keyword Await untuk inisiasi
    print('hello dari P1'); // memerlukan print untuk output
  });
};

void P2 () { // menggunakan variabel
    print('hello dari P2'); // memerlukan print untuk output
};

void main() async { // ditambahkan async juga untuk inisiasi
  await P1(); // ditambahkan await diawal untuk inisiasi harus P1 dahulu yang dijalankan
  P2(); // P2 akan dieksekusi setelah P1 tereksekusi
};
```
>Penggunaan Async-Await dengan tipe data Future bertujuan untuk menuliskan proses asynchronous layaknya synchronous dimana kode program dijalankan berurutan.

---

### **Tipe Data Future**

> Seperti yang telah ditunjukkan di Async-Await, tipe data ini digunakan untuk memberikan delay pengeksekusian sebuah kode program. Tipe data Future memerlukan Async untuk membawa dan menampilkan data return, karena Future berjalan secara asynchronous.

Bentuk penggunaan tipe data Future :
```cs
Future<String> P1 () { // menggunakan Future dengan tipe String
  return Future.delayed(Duration(seconds: 1), () { // return nilai code di dalam Future selama 1 detik
    return 'hello dari P1' // menggunakan return untuk output
  });
};

void main() async { // ditambahkan async juga untuk inisiasi
  var data = await P1(); // keyword await untuk inisiasi
  print(data);
};
```

### **Collection**

>Collection merupakan struktur data yang lebih canggih untuk menangani masalah yang lebih kompleks. Selain itu, collection bisa menyimpan kumpulan data pada satu tempat.

Contoh Collection adalah :

#### **List**

>List merupakan collection yang digunakan untuk menyimpan data secara berbaris dan setiap data didalam nya memiliki index yang berguna untuk membedakan data satu dengan yang lain. Index diawali dengan angka 0 untuk urutan pertamanya.

Berikut adalah penulisan List :
```cs
void main() async {
  var scores = []; // inisiasi untuk membuat list
  scores.add(50); // .add perintah untuk menambah data
  scores.add(70);
  scores.add(90);
  print(scores);

  print(scores[0]); // perintah untuk mengambil data berdasarkan index
  print(scores[1]);
  print(scores[2]);
};
```

Selain itu, untuk mengambil data didalam List juga dapat menggunakan perulangan For. Seperti berikut :
```cs
void main() async {
  var scores = [50, 80, 100]; // memasukkan data bisa langsung di inisiasikan
  print(scores);

  for(var score in scores) { // membuat variabel score untuk mengakses list scores
    print(score); // print untuk mengambil data list scores dari variabel score
  }
};
```

#### **Map**

>Map ini merupakan collection yang menyimpan data dengan format key-value. Key ini mempunyai fungsi seperti index yang ada pada List.

Berikut merupakan bentuk penulisan Map :
```cs
void main() async {
  var student = {}; // inisiasi untuk membuat map menggunakan kurawal
  student['nama'] = 'Ancase'; // cara menambahkan data key dan value
  student['age'] = 21;
  print(student);

  print(student['nama']); // perintah untuk mengambil data berdasarkan key
  print(student['age']);
};
```

Ada bentuk penulisan lain untuk Map dan menggunakan perulangan For untuk mengambil data, yang terlihat seperti berikut :
```cs
void main() async {
  var student = { // inisiasi langsung untuk membuat map dan isi key-value
    'nama' : 'Ancase',
    'age' : 21
  };
  print(student);

  for(var key in student.key) { // membuat variabel key untuk mengakses list student sesuai dengan urutan key
    print(student[key]); // print untuk mengambil data Map student dari variabel key
  }
};
```

---