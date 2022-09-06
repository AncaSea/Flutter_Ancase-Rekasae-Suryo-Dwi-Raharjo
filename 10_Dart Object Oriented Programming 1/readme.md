# Section 10 : Dart Object Oriented Programming 1

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Pada materi Section 10 yang berjudul Dart Object Oriented Programming 1, ini membahas tentang paradigma Object Oriented Programming atau biasa disingkat OOP di dart. Berikut adalah poin-poin yang saya bisa ambil :

### **Pengertian Object Oriented Programming**

>Object Oriented Programming atau OOP adalah suatu teknik dalam pemrograman yang berdasarkan konsep "objek", dimana objek tersebut dapat berisi data, dalam bentuk variabel atau dikenal juga sebagai atribut, serta fungsi/prosedur atau dikenal juga sebagai method. 

Pada OOP kita bisa menyusun program dalam bentuk abstrak object. Yang artinya bisa menampilkan properti atau atribut yang relevan dan menyembunyikan detail nya. Kemudian data dan proses dapat diletakkan pada abstraksi tersebut. 

### **Keuntungan memakai Object Oriented Programmming**

>Object oriented programming atau OOP memiliki beberapa keuntugan yang di antara nya adalah :
1. Mudah di analisis jika terjadi error
2. Mudah digunakan ulang karena beberapa objek memiliki ciri-ciri jadi tidak perlu membangun ulang

### **Komponen Object Oriented Programming**

>OOP sendiri memiliki beberapa komponen bagian yang merupakan bagian dari pemrogaman, seperti berikut :
>1. Class
>2. Object
>3. Property
>4. Method
>5. Inheritance
>6. Generic

Namun pada Section 10 baru akan dijelaskan 3 dari 6 komponen tersebut, antara lain adalah Class, Property, dan Method.

#### **Class**

>Class merupakan abstraksi dari sebuah object yang memiliki ciri-ciri yang disebut property. Class juga memiliki sifat dan kemampuan yang disebut method.

Untuk implementasi Class pertama-tama kita menggunakan kata awal class lalu diikuti dengan nama kemudian code detail class di letakkan dalam kurawal. Seperti berikut :
```cs
class bangunan {
    // property
    // method
}
```
Selanjutnya setelah membuat Class, kita bisa membuat object dari Class tersebut. Object merupakan bentuk sebenarnya dari class atau disebut juga dengan instance class. Object juga diperlakukan seperti data, Contoh implementasinya seperti berikut :
```cs
class bangunan {}

void main() {
    var instBangun = bangunan();

    print(instBangun);
}
```

#### **Property**

>Seperti yang dijelaskan pada Class, property merupakan ciri-ciri pada suatu class atau hal-hal yang dimiliiki suatu class untuk menggambarkan suatu objek. Sifat property sama seperti variabel yaitu memerlukan tipe data dan menginisialisasikan nilainya secara eksplisit atau nullable dengan menambahkan tanda tanya setelah tipe data.

Property dapat dibuat didalam Class, seperti contoh dibawah ini :
```cs
class hewan {
    var mata = 2;
    var ekor = 0;
}
```
Untuk mengakses property cara nya seperti variabel tapi melalui sebuah objek, seperti berikut :
```cs
void main() {
    var h1 = Hewan();
    print(h1.mata);
}
```

#### **Method**

>Method merupakan sifat dari suatu Class atau suatu aktifitas yang bisa dikerjakan suatu class. Method juga merupakan sebuah function yang terdapat di dalam sebuah Class.

Untuk membuat method sama seperti membuat fungsi tetapi diletakkan di dalam sebuah Class, seperti berikut :
```cs
class hewan {
    void bersuara() {
        print('');
    }
}
```
Kemudian untuk menjalankan sebuah method juga sama seperti menjalankan sebuah fungsi tapi melalui sebuah objek, seperti berikut :
```cs
void main() {
    var h1 = hewan();
    h1.bersuara();
}
```