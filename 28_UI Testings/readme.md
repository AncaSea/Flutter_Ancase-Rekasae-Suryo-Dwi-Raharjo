# Section 28 : UI Testings

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 28 menjelaskan tentang pengertian UI testing, Keuntugan UI Testings, dan cara implementasi atau melakukan UI testing itu sendiri.

### **Pengertian UI Testings**

>UI Testings adalah pengujian yang dilakukan pada tampilan suatu aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberi respon kepada pengguna. 

UI Testing juga disebut widget testing karena pengujian dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis.

### **Keuntungan UI Testings**

UI Testings mempunyai beberapa keuntungan yaitu antara lain:
- Memastikan seluruh widget memberi tampilan yang sesuai
- Memastikan seluruh interaksi dapat diterima dengan baik
- Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget

### **Implementasi UI Testings**

Berikut ini adalah langkah-langkah melakukan UI Testings:
1. Instalasi Package Testing <br>
   Umumnya package testing sudah default sejak project dibuat, namun jika belum dapat ditambahkan seperti berikut:
   ```cs
   dev_dependencies
    flutter_test:
        sdk: flutter
   ```
2. Penulisan file Testing <br>
   Membuat file testing dilakukan pada folder test lalu nama file harus diikuti _test.dart dibelakang
3. Mendaftarkan Testing <br>
   Tiap skenario pengujian disebut `test case`, untuk mendaftarkan testing dilakukan pada main() yang didalamnya dapat dituliskan script testing
4. Script Testing <br>
   Test case diawali dengan testWidgets dan diberi judul, contoh simulasi memerikan halaman 'AboutScreen' apakah tersebut terdapat teks "About Screen"
   ```cs
   testWidgets('Judul halaman harus About Screen', WidgetTester tester) async {
    await tester.pumpWidget(
        const MaterialApp(
            home: AboutScreen(),
        ),
    );
    expect(find.text('About Screen'), findsOneWidget);
   }
   ```
5. Menjalankan Testing <br>
   Kemudian untuk menjalankan testing dapat dengen mengetikkan perintah `flutter test` di terminal, yang akan menjalankan seluruh file test yang dibuat. <br>
   Hasil dari perintah tersebut berupa lamanya waktu pengujian, total pengujian yang dilakukan, dan pesan bahwa pengujian berhasil atau jika gagal akan ditampilkan penyebab gagalnya pengujian

---