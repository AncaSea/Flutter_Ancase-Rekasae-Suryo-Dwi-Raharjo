# Section 21 : Flutter State Management (Provider)

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 21 menjelaskan tentang state manamegement menggunakan provider mulai dari pengertian state, alasan menggunakan global state, dan penjelasan tentang global state itu sendiri.

### **State**

>State adalah sebuah cara untuk mengatur data / state kita bekerja, bisa juga untuk memisahkan antara logic dan view, dimana logic tersebut juga bisa reusable.

State mempunyai ciri-ciri:
- Data yang dapat dibaca saat pembuatan widget
- Dapat berubah saat widget sedang aktif
- Hanya dimiliki oleh StatefulWidget

### **Alasan menggunakan Global State**

>Kenapa menggunakan Global State karena agar antara widget dapat memanfaatkan state yang sama dengan mudah.

Untuk memanfaatkan state:
- Dibuat sebagai property dari class
- Digunakan pada widget saat build

Berikut contoh code:
```cs
// property
var number = 0;

// build
Text('$number');
```

Lalu untuk mengubah state menggunakan metode setState, seperti:
```cs
ElevatedButton(
    child: const Text('Tambah'),
    onPressed: () {
        setState(() {
            number = number + 1;
        });
    },
);
```

### **Global State**

>Global State adalah state yang mempunyai fungsi dapat digunankan untuk seluruh widget.

Salah satu global state adalah provider, merupakan salah satu State Management pada Flutter yang mempunyai fungsi untuk memisahkan logic dan view. Sehingga logic tersebut bisa digunakan kembali di class yang berbeda.

Untuk menggunakan provider kita harus menginstall nya di pubspec.yaml terlebih dahulu dan lalu di import. Berikut langkah menginstall nya:
- Menambahkan package provider di dependencies dalam file pubspec.yaml
- Kemudian save atau jalankan flutte pub get di terminal
- Buat file bernama Contact.dart
- Definisikan state dalam bentuk class, berikut isi code nya:
  ```cs
  import 'package:flutter/material.dart';

  class Contact with ChageNotifier {
    List<Map<String, String>> _contacts = [];

    List<Map<String, String>> get contacts => _contacts;

    void add(Map<String, String> contact) {
        _contacts.add(contact);
        notifyListeners();
    }
  }
  ```
- Mendaftarkan state provider dengan import provider ke main.dart
- Daftarkan pada runApp dengan MultiProvider
  ```cs
  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:phonebookapp/stores/contact.dart' as contact_store;

  void main() {
    runApp(
        MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (_) => contact_store.Contact())
            ],
            child: MyWidget(),
        ),
    );
  }
  ```

Lalu berikut cara menggunakan state dari provider:
- Simpan provider dalam variable
- Ambil data provider melalui getter
  ```cs
  final contactProvider = Provider.of<contact_store.Contact>(context);

  ListView.Builder(
    itemCount: contactProvider.contacts.length,
    itemBuilder: (context, index) {
        return ListTile(
            title: Text(contactProvider.contacts[index]['name'] ?? ''),
            subtitle: Text(contactProvider.contacts[index]['phone'] ?? ''),
        );
    },
  );
  ```

  ---
  