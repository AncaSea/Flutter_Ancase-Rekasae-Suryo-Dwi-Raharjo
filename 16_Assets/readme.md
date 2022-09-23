# Section 16 : Assets

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Pada Section 16 yang berjudul Assets ini akan membahas tentang beberapa topik seperti :

### **Assets**

>Assets adalah file yang dibundled dan di deployed bersamaan dengan aplikasi. Assets juga memiliki beberapa tipe, anatara lain :

- static data (JSON files)
- icons
- images
- font file (ttf)

Untuk menentukan assets di Flutter harus di inisiasi terlebih dahulu. Inisiasi tersebut flutter menggunakan yang namanya *pubspec.yaml* <br>
File tersebut terletak pada root project yang berguna untuk mengidentifikasi assets yang dibutuhkan pada aplikasi. Bisa di inisiasi satu assets saja dengan menuliskan alamat URL folder lalu file nya, seperti :
```cs
assets:
    - assets/my_icon.png
    - assets/background.png
```
atau satu folder yang di dalam nya ada lebih dari satu assets dengan hanya menuliskan alamat URL folder nya, seperti :
```cs
assets:
    - assets/
```

### **Image**

>Image atau gambar adalah format gambar dari project asset dan internet yang akan membuat tampilan aplikasi menjadi. Flutter mendukung beberapa format, seperti :
- jPEG
- WebP
- GIF
- PNG
- Animated WebP/GIF
- BMP
- WBMP

Untuk menggunakan Images pada Flutter bisa dengan code seperti berikut :
```cs
body: Column(
    children: const [
        Image(
            image: AssetImage('assets/icon.png'),
        ),
        Image(
            image: AssetImage('assets/background.png'),
        ),
    ],
);
```
Atau langsung di inisiasi property `image` nya setelah widget `Image`, seperti :
```cs
body: Column(
    children: const [
        // Menambahkan image yang ada didalam project
        Image.asset('assets/icon.png'),

        // Menambahkan image yang ada di internet
        Image.network('https://picsum.photos/id/1/200/300'),
    ],
);
```

### **Font**

>Font adalah sebuah gaya tulisan yang memiliki beragam ukuran, bentuk, dan ketebalan. Penggunaan custom font atau dari package oleh UI designer dengan style tertentu akan menjadi keunikan dan keindahan pada aplikasi.

Penggunaan Custom Font :
1. Cari dan download font yang ada di internet
2. Import file .ttf ddengan membuat folder font
3. Daftarkan folder font di pubspec.yaml, contoh :
   ```cs
   fonts:
      - family: Rowdies
        fonts:
            - asset: fonts/Rowdies-Bold.ttf
            - asset: fonts/Rowdies-Light.ttf
            - asset: fonts/Rowdies-Regular.ttf
   ```
4. Mengatur font sebagai default di MaterialApp dengan code :
   ```cs
   theme: ThemeData(fontFamily: 'Rowdies'),
   ```
   Atau jika ingin hanya spesifik widget dengan code :
   ```cs
   fontFamily: 'Rowdies',
   ```

Penggunaan font dari package : 
1. Tambahkan package google_fonts di dependencies
2. Import package di file dart seperti import dependencies biasanya
3. Panggil font tersebut didalam widget dengan code :
   ```cs
   style: GoogleFonts.rowdies(fontSize: 30),
   ```

---