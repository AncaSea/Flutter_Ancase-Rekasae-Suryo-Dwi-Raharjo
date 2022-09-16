# Section 13 : Platform Widget

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Pada section 13 ini membahas tentang platform widget pada flutter seperti MaterialApp dan CupertinoApp.

### **MaterialApp**

>MaterialApp adalah widget dasar yang mengemas seluruh widget dalam aplikasi flutter. Material digunakan pada sistem Android dan di import dari package:flutter/material.dart

Struktur pada MaterialApp :
- Pada Widget pertama kali dibuka, diletakkan pada bagian home. Code nya berupa `home: const HomePage()`
- Untuk mengatur halaman juga dapat dilakukan dengan menggunakan routes dan initialRoute, seperti :
```cs
MaterialApp (
    intialRoute: 'home', // berguna untuk inisiasi rute
    
    // berguna untuk mendaftarkan rute
    route: {
        'home': (_) => const HomePage(),
    },
)
```
Dalam MaterialApp juga terdapat widget dasar yang diperlukan setelah inisiasi widget MaterialApp, yaitu :

#### **Scaffold**

>Widget Scaffold ini diperlukan untuk membangun sebuah halaman pada MaterialApp.

Struktur nya sendiri jika dituliskan bersama pembentukan tata letak sebuah halaman yang ditulis melalui properti-properti sebagai berikut :
```cs
MaterialApp (
    Scaffold (
        appBar: AppBarr(...), // Bar menu bagian atas halaman
        drawer: Drawer(...), // Menu bagian samping halaman
        body: ... , // Bagian utama halaman

        // Menu bagian bawah halaman
        bottomNavigationBar: BottomNavigationBar(...),
    );
)
```

---

### **CupertinoApp**

>CupertinoApp adalah widget dasar yang mengemas seluruh widget dalam aplikasi. Perbedaan widget CupertinoApp dengan MaterialApp adalah penggunaan ke sistem nya. Jika MaterialApp merupakan widget yang digunakan pada sistem Android, maka CupertinoApp adalah widget yang digunakan pada sistem IOS. Dan CupertinoApp di import dari package:flutter/cupertino.dart

Struktur widget yang pertama kali dibuka pada widget CupertinoApp sendiri hampir sama seperti MaterialApp yaitu diletakkan pada bagian home dengan code `home: const HomePage()`

Dalam CupertinoApp juga terdapat widget dasar yang diperlukan setelah inisiasi widget CupertinoApp seperti pada MaterialApp, yaitu :

#### **CupertinoPageScaffold**

>Seperti Scaffold di MAterialApp, CupertinoPageScaffold ini digunakan untuk membangun sebuah halaman pada widget CupertinoApp

Jika dituliskan bersama widget-widget pembentukan tata letak halaman maka akan tampil seperti berikut :
```cs
CupertinoApp (
    CupertinoPageScaffold (

        // Bar menu bagian atas halaman
        navigationBar: CupertinoNavigationBar(...),

        // Bagian utama halaman
        child: ... ,
    )
)
```

---
