# Section 24 : Storages

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 24 menjelaskan tentang Storages atau penyimpanan lokal yang digunakan di Flutter untuk menyimpan data user, input user, dll. Penyimpanan lokal diperlukan karena untuk efisiensi penggunaan data internet. Penyimpanan lokal Flutter memiliki beberapa cara implementasi, contoh nya: 

### **Shared Preference**

>Shared preference digunakan untuk menyimpan data yang sederhana dengan format key-value. Data yang disimpan mempunyai tipe data dasar seperti teks, angka, dan boolean. Contoh penggunaan shared preference seperti menyimpan data login dan menyimpan riwayat pencarian.

Berikut beberapa contoh langkah implementasi shared preference:
1. Menambahkan package shared_preference pada dependencies di pubspec.yaml
2. Membuat properti untuk TextEditingController lalu di tambahkan di TextField
3. Membuat method dispose untuk menghindari kebocoran memori
4. Membuat variabel untuk menyimpan SharedPreference dan nilai bool newUser
5. Membuat method asynchronous untuk mengecek login lalu di panggil di initState agar dipanggil pertama kali setelah aplikasi berjalan
6. Di dalam onPressed elevated button submit buat variabel baru untuk menampung input dari user
7. Membuat setBool dan setString di dalam blok kode if untuk navigasi ke halaman berikutnya
8. Di halaman baru buat variabel untuk menyimpan SharedPreference dan username
9. Membuat method asynchronous intial untuk fungsi getter SharedPreference menggunakan getInstance dan username menggunakan setState
10. Kemudian data username bisa ditampilkan pada teks, sedangkan data SharedPreference digunakan untuk logout

### **Local Database**

>Local Database digunakan untuk menyimpan dan meminta data dalam jumlah besar pada local device yang bersifat privat. Local database menggunakan SQLite database yang bersifat open source dengan mendukung insert, read, update, dan remove data melalui package sqflite.

Berikut beberapa langkah implementasi local database SQLite pada lanjutan projek Task Management:
1. Menambahkan package sqflite dan path di pubspec.yaml
2. Membuat model, fungsi toMap dan fungsi fromMap
3. Membuat file database_helper.dart berisi class baru dengan contructor database
4. Membuat objek database nya
5. Membuka koneksi ke database dan membuat tabel nya
6. Membuat method untuk menambahkan data ke tabel
7. Membuat method untuk membaca data
8. Membuat method untuk mengambil data dengan id
9. Membuat method memperbaharui data dan method menghapus data
10. Membuat file db_manager.dart
11. Membuat constructor untuk membuat instance kelas DatabaseHelper
12. Membuat method _getAllTasks
13. Membuat method addTask, getTaskById, updateTask, dan deleteTask
14. Mengganti provider menjadi DbManager di main.dart
15. Mengganti Consumer yang ada di buildTaskScreen jadi DbManager di task_screen.dart
16. Menghapus kode provider yang ada di onPressed floating action button task_screen.dart
17. Menghapus properti onCreate dan membuat properti baru taskModel di task_item_screen.dart
18. Menghapus properti _taskName lalu membuat properti baru _isUpdate dan ganti kode pada blok moethod initState di task_item_screen.dart
19. Mengganti kode yang ada di blok kode onPressed builBuutton
20. Mengganti TaskManager menjadi DbManager di task_list_screen.dart
21. Membungkus ListView.separated dengan Consumer<DbManager> dan pindahkan variabel taskItems di dalam builder Consumer
22. Hapus key yang ada di widget TaskItemCard dan ganti index untuk deleteTask nya menggunakan item.id
23. Bungkus widget TaskItemCard dengan widget InkWell dan gunakan onTap dengan fungsi async, kemudian di dalam blok fungsi nya ditambahkan variabel selectedTask yang menampung item.id
24. Terakhir tambahkan navigasi ke TaskItemScreen