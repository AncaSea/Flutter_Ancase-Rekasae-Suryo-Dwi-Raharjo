# Section 6 : Basic Dart Programming

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## Summary

>Pada section keenam ini dijelaskan tentang Basic Dart Programming, poin-poin yang saya tangkap dan pahami adalah :

### **Mempunyai fungsi main**

untuk menjalankan nya harus ada yang namanya **fungsi main**. Yang merupakan top level function di dart memiliki tipe data void (tidak mengembalikan nilai) atau int.
   
   Didalam fungsi main ini, dapat dibuat macam code contoh nya seperti :
```cs
void main(){` 
   print('Hello World'); 
}
```
   Seperti contoh diatas didalam fungsi main terdapat code print yang digunakan untuk mengeksekusi dan menampilkan sebuah text atau bisa juga nilai variable, object yang di ketik di dalam print.

---

### **Dapat ditambahkan komentar**

   Selanjutnya ada cara untuk menambah kan **komentar** didalam dart.
   >Komentar ini berisi baris code yang tidak dijalankan atau tidak akan dieksekui dengan tujuan untuk memberi catatan code yang lain.
   
   Tata cara penulisan komentar itu sendiri adalah dengan menambahkan awalan garis miring (/) dua kali, pada baris code. Atau bisa menggunakan hotkeys `ctrl+/` <br>
   Bentuk code nya adalah seperti berikut :
   ```cs
   void main(){
   // ini adalah komentar 
   print('Hello World'); 
   }
   ```

   Lalu ada cara kedua yaitu dengan awalan menggunakan tanda garis miring dahulu kemudian bintang dan akhiran bintang dahulu kemudian garis miring, maka akan seperti berikut :
   ```cs
   void main(){
   /* 
    ini
    adalah
    komentar
   */
   print('Hello World');
   }
   ```

---

### **Mempunyai Variabel**

>Variabel mempunyai fungsi untuk menyimpan data yang diinginkan. Variabel juga memiliki nama untuk membedakan variabel satu dengan yang lainnya, dan tentunya juga harus memiliki tipe data. <br> 

Variabel sendiri dapat dideklarasikan seperti : <br>
```cs
int nilai;
```

Dimana int adalah tipe datanya lalu "nilai" adalah nama variabel kemudian diakhiri semicolon atau titik koma (;) dan variabel tersebut tidak bernilai atau null karena belum di masukkan nilai data nya.

Untuk mengisi nilai pada suatu variabel bisa dengan inisiasi langsung di variabel atau tidak. contoh inisiasi langsung :
```cs
void main() {
  var tahun = 2022;
}
```
Contoh inisiasi tidak langsung :

```cs
void main() {
  var tahun;
  tahun = 2022;
}
```

---

### **Konstanta**

> Konstanta merupakan tipe data yang digunakan untuk deklarasi variabel immutable yang nilainya bersifat konstan dan harus sudah diketahui pada saat waktu kompilasi (Compile time) berjalan, artinya adalah nilai dari variabel tersebut harus sudah di berikan value secara langsung. Dan nilai nya tidak bisa di override atau di ganti lagi.

Penulisan konstanta ini sama seperti inisiasi variabel lainnya, hanya saja variabel konstanta menggunakan tipe data final. Berikut bentuk penulisannya :
```cs
void main() {
  final tahun = 2022;  
}
```

---

### **Tipe Data**

>Disini dijelaskan macam-macam tipe data yang ada pada penulisan variabel juga dikelola di bahasa pemrogaman dart dan ada beberapa tipe data primitif atau sederhana.

Berikut ini adalah jenis tipe data yang ada di bahasa pemrogaman dart beserta contoh penulisannya :

1. int, digunakan untuk menyimpan nilai data bilangan bulat saja
```cs
void main() {
  int nilai = 100;  
}
```
2. double, sama seperti int hanya saja digunakan untuk menyimpan nilai data bilangan pecahan atau desimal
```cs
void main() {
  double nilai = 100.0;  
}
```
3. bool, hanya bisa digunakan untuk menyimpan nilai data true atau false
```cs
void main() {
  bool pria = true;  
}
```
4. String, digunakan untuk menyimpan nilai data berbentuk text
```cs
void main() {
  String nama = 'Ancase';  
}
```
---

### **Operator**

>Operator merupakan simbol atau tanda yang digunakan untuk operasi pengolahan data di bahasa pemrogaman dart. Kemudian data yang dikelola disebut operand.

Ada beberapa jenis operator yang digunakan untuk mengolah sesuai tipe nya. seperti :

1. Arithmetic <br>
   Pada tipe arithmetic untuk operator yang digunakan adalah + , - , * , / , %
   ```cs
    void main() {
        print(1 + 1); // untuk pertambahan
        print(4 - 3); // untuk pengurangan
        print(5 * 2); // untuk perkalian
        print(12 / 6); // untuk pembagian
        print(4 % 3); // untuk sisa bagi
    }
    ```
2. Assignment <br>
    Operator yang ada di tipe Assignment adalah = , += , -= , *= , /= , %=
    ```cs
    void main() {
        var usia = 22.0; // inisiasi pertama
        usia = 25; // override nilai usia menjadi 25
        print(usia); // output 25.0
        usia += 2 // tambah dengan angka dua
        print(usia); // output 27.0
        usia -= 2 // kurangi dengan angka dua
        print(usia); // output 23.0
        usia %= 2 // sisa bagi dengan angka dua
        print(usia); // output 1.0
        usia /= 2 // bagi dengan angka dua
        print(usia); // output 25.0
        usia *= 2 // kalikan dengan angka dua
        print(usia); // output 50.0
    }
    ```
3. Comparison <br>
    Tipe Comparison menggunakan operator adalah == , < , > , <= , >=
    ```cs
    void main() {
        print(2 == 2); // output true karena 2 sama dengan 2
        print(3 <= 2); // output false karena 3 lebih besar sama dengan 2
        print(1 <  2); // output true karena 1 lebih kecil 2
        print(1 >= 2); // output false karena 1 lebih kecil sama dengan 2
        print(3 >  2); // output true karena 3 lebih besar 2
    }
    ```
4. Logical <br>
    Untuk Logical sendiri menggunakan operator && , || , !
    ```cs
    void main() {
        // output true karena operator OR hanya butuh salah satunya benar 
        print(1 == 2 || 2 == 2);

        // output false karena operator AND butuh kedua nya benar
        print(3 == 2 && 2 == 2);

        bool notTrue = !true; // contoh penggunaan tanda seri (!)
        print(notTrue); // output false karena nilai true dibalik oleh "!"
    }
    ```

---

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