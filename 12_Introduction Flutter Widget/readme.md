# Section 12 : Introduction Flutter Widget

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 12 membahas tentang apa itu Flutter dan widget nya. Terdapat 4 poin yang dibahas pada section 12 ini, antara lain :

### **Perkenalan Flutter**

>Pertama-tama apa itu Flutter? flutter adalah alat pengembangan antarmuka pengguna yang digunakan untuk membuat aplikasi mobile, desktop, dan web. Flutter terdiri dari software development kit atau SDK yang merupakan alat-alat untuk membantu proses pengembangan aplikasi.SDK juga sudah terdapat framework yang berguna untuk membentuk sebuah aplikasi custom.

Flutter juga mempunyai beberapa keunggulan seperti :
1. Mudah digunakan dan dipelajari
2. Produktivitas tinggi
3. Dokumentasi lengkap seperti flutter.dev
4. Komunitas yang berkembang seiring berinovasinya teknologi

Selanjutnya juga ada tata cara dalam pembuatan project Flutter, yaitu :
1. Membuat project dengan menjalankan perintah
```cs
flutter create <nama_project>
```
2. Setelah itu masuk ke folder direktori nya lalu bisa langsung menjalankan code program default dengan cara perintah :
```cs
flutter run
```

Di dalam folder direktori flutter terdapat struktur yan bisa dibagi menjadi direktori platform dan direktori project. Pada direktori platform adalah direktori yang merupakan folder basis perangkat seperti android, ios, dan web. Sedangkan yang termasuk direktori project adalah folder lib yang berisi ruang kerja utama dan test yang berisi aktivitas pengujian project.

Selain itu, file utama dari direktori flutter bernama `main.dart` di dalam folder lib tadi. File utama disini adalah file yang pertama kali dibaca saat dijalankan kode program nya seperti berikut :
```cs
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
```

>Widget merupakan komponen-komponen pendukung pada Flutter seperti Button, Text, Icon dan lain sebagainya. Widget digunakan untuk membentuk UI pada platform. Widget juga bisa terdiri dari beberapa widget lainnya. Widget terdapat class-class yang berguna untuk membuat widget.

Widget memiliki beberapa jenis yaitu :

### **Stateless Widget**

>Stateless widget dari nama nya sudah bisa di angan-angan bahwa widget jenis ini tidak dapat dirubah atau tidak akan pernah berubah atau tidak mempunyai state.

Stateless widget mempunyai beberapa ciri yaitu :
1. Tidak bergantung pada perubahan data
2. Hanya fokus pada tampilan
3. Dibuat dengan extends pada class StatelessWidget

Cara membuat stateless widget dengan cara :
```cs
class MyWidget extends StatelessWidget {
    const MyWidget({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context){
        return const MaterialApp(
            home: Scaffold(
                body: Text('Selamat datang di Flutter.'),
            ),
        );
    }
}
```

### **Stateful Widget**

>Untuk stateful widget sendiri merupakan jenis state widget yang dinamis atau dapat berubah. Berbanding terbalik dengan stateless, stateful widget dapat mengupdate tampilan, merubah warna, menambah jumlah baris dll. Jadi dapat disimpulkan bahwa apapun widget yang dapat berubah maka itulah stateful widget.

Ciri dari stateful widget adalah seperti berikut :
1. Mementingkan pada perubahan data
2. Dibuat dengan extends pada class StatefulWidget
3. 1 widget menggunakan 2 class (widget dan state)

Namun pada stateful ini cara membuat stateful widget adalah dengan cara meng-override method createState, seperti berikut :
```cs
class MyWidget extends StatefulWidget {
    const MyWidget({Key? key}) : super(key: key);

    @override
    createState() => MyWidgetState();
}

class MyWidgetState extends State<MyWidget> {
    @override
    Widget build(BuildContext context){
        return const MaterialApp(
            home: Scaffold(
                body: Text('Selamat datang di Flutter.'),
            ),
        );
    }
}
```

### **Built in Widget**

>Buil in Widget berbeda dengan 2 jenis widget diatas, built in widget dapat digunakan secara langsung tanpa dibuat terlebih dahulu dan sudah terinstall bersama flutter seperti Scaffold, AppBar, BottomNavigationBar, MaterialApp dll.

#### **MaterialApp**

>MaterialApp ini merupakan komponen bawaan yang digunakan untuk membangun aplikasi dengan desain material yang biasa nya ada di aplikasi Android. Kita juga dapat mengakses widget lain yang disediakan oleh Flutter SDK melalui MaterialApp.

Berikut cara menggunakan MaterialApp :
```cs
const MaterialApp();

const MaterialApp(
    home: Text('Selamat datang di Flutter.'),
);
```

#### **Scaffold**

>Scaffold merupakan komponen yang digunakan untuk membuat sebuah halaman pada Flutter. Di Scaffold ini dapat mengakses Appbar, body, drawer, dll.

Berikut adalah cara menggunakan Scaffold :
```cs
const Scaffold();

const Scaffold(
    body: Text('Selamat datang di Flutter.'),
);
```

#### **AppBar**

>Widget ini digunakan untuk membuat application bar yang terletak pada bagian atas halaman.

Berikut cara menggunakan AppBar :
```cs
AppBar;

AppBar(
    title: const Text('Home'),
);
```

#### **Text**

>Kemudian ada widget text yang berguna untuk menampilkan sebuah text pada halaman widget.

Berikut adalah contoh menggunakan widget Text :
```cs
const Text(teks);

const Text('halo...');
```

---