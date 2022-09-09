# Section 11 : Dart Object Oriented Programming 2

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Materi pada section 11 melanjutkan materi yang ada pad section 10 : Dart Object Oriented Programming 1 yang menjelaskan tentang OOP dan 3 komponen OOP yaitu Class, property, dan method. Lalu di section 11 ini akan membahas lanjutan contoh-contoh bagian komponen, yaitu :

### **Constructor**
Mempunyai ciri-ciri :
- Method yang dijalankan saat pembuatan object
- Dapat Menerima Parameter
- Tidak memiliki return
- Nama sama dengan nama class

Berikut implementasi contructor :
```cs
class Hewan {
    int mata;
    int ekor;

    Hewan() {
        mata = 2;
        ekor = 1;
    }
}
```

### **Inheritance**
Mempunyai ciri-ciri :
- Membuat class baru dengan memanfaatkan class yang sudah ada
- Bertujuan agar kemampuan class yang sudah ada dapat dimiliki oleh class baru

Berikut implementasi inheritance :
```cs
class Sapi extends Hewan {
    Sapi() {
        mata = 2;
        ekor = 1;
    }
}

void main() {
    var s1 = Sapi();
    print(s1.mata);
}
```

### **Method Overriding**
Mempunyai ciri-ciri :
- Menulis ulang method yang ada pada super class
- Bertujuan agar class memiliki method yang sama, dengan proses yang berbeda

Berikut adalah cara melakukan overriding :
- Dilakukan pada class yang melakukan inheritance 
- Method sudah ada pada class induk  
- Method ditulis ulang seperti membuat method baru pada class anak
- Ditambahkan tanda @override dibaris sebelum method dibuat

```cs
class Hewan {
    reproduksi() {
        print('Tidak Diketahui');
    }

    bernapas() {
        print('Tidak Diketahui');
    }
}

class Sapi extends Hewan {
    @override
    reproduksi() {
        print('Melahirkan');
    }

    @override
    bernapas() {
        print('Paru - paru');
    }
}

void main() {
    var s1 = Sapi();
    s1.reproduksi();
    s1.bernapas();

    var h1 = Hewan();
    h1.reproduksi();
    h1.bernapas();
}
```

### **Interface**
Mempunyai ciri-ciri :
- Berupa class
- Menunjukkan method apa saja yang ada pada suatu class 
- Seluruh method wajib di-override
- Digunakan dengan menggunakan implements 

Sekilas mirip inheritance tapi berikut cara membuat interface : 
- Pada class yang melakukan implements, wajib melakukan override semua method yang ada pada class induk

```cs
class Hewan {
    reproduksi() {
        print('Tidak Diketahui');
    }

    bernapas() {
        print('Tidak Diketahui');
    }
}

class Sapi implements Hewan {
    @override
    reproduksi() {
        print('Melahirkan');
    }

    @override
    bernapas() {
        print('Paru - paru');
    }
}

//Penggunaan Class
void main() {
    var s1 = Sapi();
    s1.reproduksi();
    s1.bernapas();

    var h1 = Hewan();
    h1.reproduksi();
    h1.bernapas();
}
```

### **Abstract Class**
Mempunyai ciri-ciri :
- Berupa class abstrak
- Menunjukan method apa saja yang ada pada suatu class
- Digunakan dengan menggunakan extends
- Tidak dapat dibuat object
- Tidak semua method harus di-override

Berikut implementasi penggunaan abstract class :

```cs
abstract class Hewan {
    reproduksi() {
        print('Tidak Diketahui');
    }

    bernapas() {
        print('Tidak Diketahui');
    }
}

class Sapi extends Hewan {
    @override
    reproduksi() {
        print('Melahirkan');
    }
}

//Penggunaan Class
void main() {
    var s1 = Sapi();
    s1.reproduksi();
    s1.bernapas();
}
```

### **Polymorphism**
Mempunyai ciri-ciri :
- Kemampuan data berubah menjadi bentuk lain
- Tipe data yang dapat digunakan adalah super class 
- Dapat dilakukan pada class dengan extends atau implements

Berikut implementasi polymorphism :
```cs
void main() {
    var s1 = sapi();
    s1.reproduksi();
    s1.bernapas();
}
```

### **Generics**
Mempunyai ciri-ciri :
- Dapat digunakan pada class atau fungsi
- Memberi kemampuan agar dapat menerima data dengan tipe yang berbeda
- Tipe data yang diinginkan, ditentukan saat membuat class atau menjalankan fungsi

Berikut cara membuat class dengan generics :
- Class Hadiah dapat dimasukkan data dengan tipe T
- Tipe T dapat digunakan diseluruh class Hadiah

```cs
class Hadiah<T> {
    var isi;

    Hadiah(T i) {
        isi = i;
    }
}
```

Kemudian cara menggunakannya :
- Setelah nama class, menjadi tempat tipe data yang diinginkan

```cs
void main() {
    var h1 = Hadiah<String>('emas24karat');
    print(h1.isi);

    var h2 = Hadiah<int>(10);
    print(h2.isi);
}
```

Berikut membuat fungsi dengan generics :
- Setelah nama fungsi, menjadi tempat variabel generics

```cs
void cekTipe<T>(T data) {
    print(data.runtimeType);
}
```

Kemudian cara menggunakannya :
- Setelah nama fungsi, menjadi tempat tipe data yang diinginkan

```cs
void main() {
    cekTipe<String>("satu");
    cekTipe<int>(1);
}
```