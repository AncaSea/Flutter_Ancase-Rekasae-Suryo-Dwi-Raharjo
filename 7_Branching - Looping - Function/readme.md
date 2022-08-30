# Section 7 : Branching, Looping, Function

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

### **Pengambilan Keputusan**

> Seperti namanya pengambilan keputusan di bahasa pemrogaman dart berguna untuk menentukan alur program pada kondisi tertentu.

Ada beberapa kode untuk melakukan pengambilan keputusan di dalam dart, diantaranya :

1. IF <br>
    Kode pengambilan keputusan IF memerlukan nilai tipe data bool (boolean), kemudian alur program akan lanjut jika nilainya bernilai true atau benar.

    Berikut penulisan kode program IF :
    ```cs
    void main() {
        var usia = 18;
        if (usia < 20) {
            print('Remaja');
        }
    }
    ```
    Dilihat dari kode diatas diparameter IF `usia < 20`, yang artinya jika usia lebih kecil 20 maka kode didalam IF `print('Remaja')` akan di jalankan.

2. IF-ELSE <br>
    Sama seperti kode pengambilan keputusan IF namun disini akan ditambahkan `else if` untuk memberitahukan ada kondisi keputusan yang lain atau akan ada `true` dan `false`.

    Berikut penulisan kode program IF-ELSE :
    ```cs
    void main() {
        var usia = 18;
        if (usia < 20) {
            print('Remaja');
        } else {
            print('tidak memiliki golongan');
        }
    }
    ```
    Dilihat kode diatas jika usia lebih kecil 18 maka akan dijalankan perintah `print('Remaja')`. Dan kondisi yang lain atau jika false, usia lebih besar 20 maka akan dijalankan perintah `print('tidak memiliki golongan')`.
    
    Atau jika ada lebih dai dua kemungkinan maka penulisan akan menggunakan else if, seperti berikut :
    ```cs
    void main() {
        var usia = 18;
        if (usia < 20) {
            print('Remaja');
        } else if (usia < 40){
            print('Dewasa');
        } else {
            print('tidak memiliki golongan');
        }
    }
    ```

---

### **Perulangan**

>Perulangan ini adalah bentuk kode progam yang berguna untuk melakukan proses berulang kali sebuah perintah sampai di sebuah titik maksimal yang di tuliskan. Contoh nya perulangan bilangan 1 sampai 100.

Ada beberapa bentuk perulangan seperti :

1. For <br>
    Untuk perulangan For ini memerlukan nilai awal, nilai boolean yang jika benar maka perulangan dilanjutkan, dan memerlukan pengubah nilai di parameter For.

    Berikut merupakan penulisan perulangan For :
    ```cs
    void main() {
        for(var i = 0; i < 10; i += 1) {
            print(i);
        }
    }
    ```
    Kode diatas menunjukan variabel `i` merupakan variabel untuk perulangan For dengan nilai awal 0. Kemudian variabel `i` lebih kecil 10 maka benar lalu dilanjutkan maksimal 9 (karena lebih kecil 10). Parameter terakhir `i += 1` artinya variabel `i` akan ditambah 1 setiap perulangan yang terjadi. Jadi output akan menampilkan angka 1-9 saja.

2. While <br>
    Pada While ini perulangan tidak akan diketahui berapa kali perulangan yang terjadi. Dan seperti perulangan For, pada While jika kondisi bool true makan perulangan akan dilanjutkan.

    Berikut merupakan penulisan perulangan For :
    ```cs
    void main() {
        var i = 0;
        while(i < 10){
            print(i);
            i++
        }
    }
    ```
    Dari kode diatas bisa diuraikan tidak seperti perulangan For. variabel awal atau nilai awal While justru di inisiasikan diluar while, namun untuk nilai bool masih di dalam parameter yaitu `i < 10`. Kemudian jika benar maka `print(i)` dijalankan yang menampilkan nilai `i` yang kemudian nilai `i` ditambah atau increment sebanyak 1.

3. Do-While <br>
    Seperti While, pada Do-While ini akan melakukan perulangan tanpa parameter nilai awal dan pengubah nilai. Namun bedanya proses dijalankan minimum sekali, dan akan diteruskan jika nilai bool adalah true.

    Berikut merupakan penulisan perulangan For :
    ```cs
    void main() {
        var i = 0;
        do {
            print(i);
            i++
        } while(i < 10);
    }
    ```

---

### **Break dan Continue**

>Break dan Continue ini adalah kode program yang berguna untuk menghentikan perulangan atau melanjutkannya. Perulangan akan menggunakan nilai bool seperti biasa untuk lanjut atau berhenti. Jika menggunakan break untuk menghentikan semua proses perulangan dengan mengabaikan nilai bool, sedangan jika hanya continue dapat menghentikan satu kali proses.


Berikut merupakan penulisan break :
```cs
void main() {
    for(var i = 0; true; i++){
        if(i == 10) {
            break;
        }
        print(i);
    }
}
```
Penjelasan kode diatas adalah break digunakan untuk setelah `i` ditambah atau increment nilainya di perulangan For maka jika `i` sudah sama dengan 10 break akan menghentikan proses perulangan tersebut.

Berikut merupakan penulisan continue :
```cs
void main() {
    for(var i = 0; i < 10; i++){
        if(i == 5) {
            continue;
        }
        print(i);
    }
}
```
Untuk continue digunakan untuk setelah `i` ditambah atau increment nilainya di perulangan For sampai 9, maka jika `i` sudah sama dengan 5 continue akan melewati proses perulangan di angka 5 tersebut dan lanjut sampai angka 9.

---

### **Fungsi**

>Fungsi merupakan kumpulan kode perintah yang dapat digunakan berulang kali dan jika ingin mengubah semua perintah hanya sekali saja maka penggunaan yang lain akan ikut berubah.

Penulisan fungsi diawali dengan inisiasi tipe data lalu dilanjutkna nama fungsi nya dan didalam fungsi merupakan kode yang ingin dijalankan, seperti berikut :
```cs
void halo() {
    print('halo');
}
```
Lalu untuk memanggil sebuah fungsi hanya tinggal tuliskan nama fungsi di fungsi main, seperti berikut :
```cs
void main() {
    halo();
}
```
Fungsi juga dapat mengirimkan data saat menjalankan fungsi tersebut, contoh penulisannya sebagai berikut :
```cs
void tampil(String teks) {
    print(teks);
}

void main() {
    tampil('halo');
}
```
Selain dengan print untuk output nya, fungsi juga bisa menggunakan return jika tipe data fungsi selain void. Contoh penulisannya sebagai berikut :
```cs
int jumlah(int a, int b) {
    return a + b;
}

void main() {
    var hasil = jumlah(1, 2);
    print(hasil);
}
```

---
