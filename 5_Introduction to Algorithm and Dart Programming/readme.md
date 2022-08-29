# Section 5 : Introduction to Algorithm and Dart Programming

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## Summary

>Pada section kelima ini dijelaskan tentang dasar fundamental pertama flutter, poin-poin yang saya tangkap dan pahami adalah :

## 1. Memakai bahasa pemrogaman yang bernama Dart. 
   
>Bahasa Dart merupakan bahasa pemrograman yang dirancang oleh Google untuk pengembangan klien, seperti untuk web dan aplikasi seluler. Sebagai salah satu dari banyaknya programming language yang mendukung multi paradigma, Dart, bersifat imperatif, fungsional, reflektif dan berorientasi objek.<br> 
   Selain itu, Dart dapat dijalankan pada sistem operasi yang berbeda seperti Windows, Linux, Unix dan MacOS, dll yang kemudian disetujui sebagai standar oleh Ecma, yang saat ini digunakan untuk membangun aplikasi web, server, desktop, dan seluler.

---

## 2. Kenapa Harus Dart?
   
>Dart memiliki beberapa kelebihan diantaranya adalah : <br>
   a. Type safe, atau menjaga dan menjamin konsistensi tipe data nya. <br>
   b. Null safety, memberi keamanan dari data bernilai null atau tidak ada nilai. <br>
   c. Rich Standard library, yang artinya Dart memberi banyak dukungan library internal. <br>
   d. Multiplatform, mampu berjalan di beberapa jenis perangkat. <br>

---

## 3. Dasar Pemrogaman Dart
   
> Pada bahasa pemgrogaman **Dart** ada beberapa dasar code layaknya seperti bahasa pemrogaman lainnya dan bahkan sama diantaranya : 

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

### Tipe Data

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

### Operator

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