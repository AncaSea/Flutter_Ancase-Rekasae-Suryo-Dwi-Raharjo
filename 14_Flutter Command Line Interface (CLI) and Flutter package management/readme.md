# Section 14 : Flutter Command Line Interface (CLI) and Flutter package management

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

### **Flutter CLI**

>Flutter CLI mempunyai beberapa poin, yaitu :
- Alat yang digunakan untuk berinteraksi dengan Flutter SDK
- Perintah dijalankan dalam terminal

Selain itu Flutter CLI juga memiliki beberapa command, sebagai berikut :

#### **Macam - Macam CLI Command**

- Flutter Doctor <br>
Perintah untuk menampilkan informasi software yang dibutuhkan flutter. Dapat dituliskan dengan :
```cs
flutter doctor
```

- Flutter Create <br>
Perintah untuk membuat project aplikasi flutter baru di directory tertentu. Dapat dituliskan dengan :
```cs
flutter create <app_name>
```

- Flutter Run <br>
Perintah untuk menjalankan project aplikasi didevice yang tersedia. Dapat dituliskan dengan :
```cs
flutter run <dart_file>
```
- Flutter Emulator <br>
Perintah untuk menampilkan daftar emulator yang terinstall dan menampilkan option untuk membuka emulator atau membuat emulator baru. Dapat dituliskan dengan :
```cs
flutter emulator
flutter emulator --launch <emulator_id>
flutter emulator --create [--name xyz]
```

- Flutter Channel <br>
Perintah untuk menampilkan daftar flutter channel yang tersedia dan menunjukkan channel yang digunakan saat ini. Dapat dituliskan dengan :
```cs
flutter channel
```

- Flutter Pub add & get <br>
Flutter Pub add berguna untuk menambahkan packages ke dependencies yang ada di pubspec.yaml, dapat dituliskan dengan :
```cs
flutter pub add <package_name>
```

<br>

Flutter Pub get berguna untuk mendownload semua packages atau dependencies yang ada di pubspec.yaml, dapat dituliskan dengan :

```cs
flutter pub get
```

- Flutter Build <br>
Perintah untuk memproduksi sebuah file aplikasi untuk keperluan deploy atau publish ke AppStore, PlayStore, dll. Dapat dituliskan dengan :
```cs
flutter build<directory>
```

- Flutter Clean <br>
Perintah untuk menghapus folder build serta file lainnya yang dihasilkan saat kita menjalankan aplikasi di emulator, perintah ini akan memperkecil ukuran project. Dapat dituliskan dengan :
```cs
flutter clean
```

### **Packages Management**

>Kemudian ada packages management mempunyai beberapa poin, antara lain :
- Flutter mendukung sharing packages
- Packages dibuat developers lain
- Memepercepat pengembangan aplikasi karena tidak perlu membuat semuanya dari awal atau from scratch
- Mendapatkan packages diwebsite pub.dev

Kemudian cara menambahkan packages sebagai berikut :

#### **Cara Menambahkan Packages**

>Berikut ini adalah langkah-langkah dalam menambahkan packages :
- Cari package di pub.dev
- Copy baris dependencies yang ada dibagian installing 
- Buka pubspec.yaml
- Paste baris pada dependencies pubspec.yaml
- Run flutter pub get diterminal
- Import package di file dart agar bisa digunakan 
- Stop atau restart aplikasi jika dibutuhkan