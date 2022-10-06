# Section 23 : Flutter Animation

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 23 menjelaskan tentang apa itu animation, implicit animation, transition, dan transisi umum

### **Animation**

>Animasi merupakan teknik untuk membuat aplikasi terlihat hidup. Widget yang bergerak karena animasi akan menambah daya tarik. Selain itu animasi juga bisa digunakan untuk pergerakan dari kondisi satu ke kondisi lain.

### **Implicit Animation**

>Implisit animasi ini merupakan versi animasi dari widget yagn sudah ada.

Contoh penggunaan:
```cs
bool isBig = false;

AnimatedContainer(
    width: isBig ? 200 : 100;
    height: isBig ? 200 : 100;
    color: Colors.red,
    duration: const Duration(milliseconds: 300),
);
```

### **Transition**

>Transisi adalah bagian dari animasi yang terjadi saat perpindahan pada suatu halaman. Dan terletak pada bagian Navigator.push()

Berikut cara penggunaan transition:
```cs
    Navigator.of(context).push(
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
                return const AboutScreen();
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                final tween = Tween(begin: const Offset(0, .5), end: Offset.zero);

                return SlideTransition(
                    porsition: animation.drive(tween),
                    child: child,
                ),
            },
        ),
    );
```

### **Transtion Umum**

>Transisi umum ada beberapa macam, salah satu nya FadeTranstion dan ScaleTransition.

1. FadeTransition
   >Transisi dengan halaman muncul dengan efek redup menuju ke tampak jelas secara penuh. Berikut contoh penggunaanya:
   ```cs
   final tween = Tween(begin: 0.0, end: 1.0);
   return FadeTransition(
        opacity: animation.drive(tween),
        child: child,
   );
   ```
2. ScaleTransition
   >Transisi dengan halaman muncul efek berubah ukuran dari tidak penuh menuju tampil keseluruhan. Berikut contoh penggunaanya:
   ```cs
   final tween = Tween(begin: 0.0, end: 1.0);
   return ScaleTransition(
        scale: animation.drive(tween),
        child: child,
   );
   ```

---