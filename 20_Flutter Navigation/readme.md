# Section 20 : Flutter Navigation

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 20 menjelaskan tentang navigasi pada flutter dari pengertian, dasar navigasi, dan navigasi dengan named routes

### **Apa itu Navigation**

>Navigation atau navigasi adalah suatu interaksi yang memungkinkan pengguna berpindah dari halaman satu ke halaman lain.

Navigasi merupakan widget flutter yang sering digunakan routing dan menampilkan konten dari satu halaman ke halaman lainnya.

### **Navigation Dasar**

>Dasar Navigasi dijelaskan beberapa komponen dari navigation yang mempunyai kegunaan masing-masing.

Meliputi:
- `Navigator.push()`, mempunyai fungsi untuk berpindah halaman selanjutnya <br>
  Contoh penggunaan code:
  ```cs
  Center(
    child: ElevatedButton(
        child: const Text('About Screen'),
        onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const AboutScreen(),
                )
            )
        }
    )
  );
  ``` 
- `Navigator.pop()`, mempunyai fungsi untuk kembali ke halaman sebelumnya <br>
  Contoh penggunaan code nya:
  ```cs
  Center(
    child: ElevatedButton(
        child: const Text('About Screen'),
        onPressed: () {
            Navigator.pop(context, 'OK'),
        }
    )
  );
  ```

Selain itu, navigation tadi dijelaskan bisa untuk mengirim data ke halaman baru. Cara mengirim nya menggunakan parameter pada constructod halaman yang akan dituju. Contoh:
```cs
ElevatedButton(
    child: const Text('Go To About Page'),
    onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const AboutScreen(parameter: 'data'),
            )
        )
    }
);
```
```cs
class AboutScreen extends StatelessWidget {
    final String parameter;
    const AboutScreen({Key? key, required this.parameter}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return ...;
    }
}
``` 

### **Navigation dengan Named Routes**

>Navigation dengan named route disini maksutnya adalah untuk berpindah-berpindah halaman. Maka harus di inisiasi route nya terlebih dahulu, bahkan route awal atau home juga harus di inisiasi.

Untuk berpindah menggunakan code `Navigator.pushNamed()` dan untuk kembali masih sama yaitu menggunakan `Navigator.pop()`

Berikut langkah cara penggunaan navigator dengan named route:
- Tambahkan initialRoute dan routes pada MaterialApp
- Tiap route adalah fungsi yang membentuk halaman
  ```cs
  MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
        '/': (_) => const HomeScreen(),
        '/about': (_) => const AboutScreen(),
    },
  );
  ```
- Lalu untuk tombol pindah halaman selanjutnya:
  ```cs
  ElevatedButton(
    child: const Text('Go To About Page'),
    onPressed: () {
        Navigator.of(context).pushNamed('/about');
    }
  );
  ```

Navigator dengan Named Route bisa untuk mempassing data dari halaman satu ke halaman lainnya. Untuk penggunaan nya seperti berikut:
```cs
ElevatedButton(
    child: const Text('Go To About Page'),
    onPressed: () {
        Navigator.of(context).pushNamed(
            '/about',
            arguments: 'data',
        )
    }
;)
```
Lalu untuk memanggil data yang sudah di passing sebagai berikut:
```cs
class AboutScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final parameter = ModalRoute.of(conxtext)!.settings.arguments as String;

        return ...;
    }
}
```

---
