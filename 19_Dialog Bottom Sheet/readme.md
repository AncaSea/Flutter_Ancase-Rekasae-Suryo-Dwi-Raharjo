# Section 19 : Dialog Bottom Sheet

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 19 membahas tentang Projek Aplikasi Task Management yang sudah dikerjakan kemarin, yang dilanjut Alert Dialo dan Bottom Sheet.

### Aplikasi Task Management

>Aplikasi Task Management ini materi tentang pembuatan aplikasi yang mempunyai fungsi menambahkan dan menghapus kegiatan di aplikasi. Dan juga aplikasi task management menggunakan provider untuk fungsi tambah dan hapus nya dan uuid untuk memberi id unik setiap item. 

Aplikasi Task Management terdapat:
- File model di task_model.dart untuk informasi yang ingin disimpan
- Task_Screen.dart untuk menampilkan item kegiatan
- Empty_task_screen.dart untuk screren kosong jika item kegiatan tidak ada
- Task_manager.dart untuk fungsi tambah dan hapus kegiatan
- Task_item_screen.dart untuk tampilan form yang berfungsi menambahkan item kegiatan
- Task_item_card.dart untuk membuat tampilan item beerbentuk card.

### Alert Dialog

>Alert Dialog mempunyai deskripsi sebagai berikut:
- Untuk tampilan android, dari material design
- Menginformasikan pengguna tentang situasi tertentu
- Bisa digunakan untuk mendapatkan input dari user
- Membutuhkan helper method showDialog

Kemudian alert dialog ini ditambahkan ke task_item_card.item dengan membungkus dahulu dengan showDialog untuk validasi ingin lanjut menghapus item atau tidak.

### Bottom Sheet

>Bottom sheet mempunyai ciri sebagai berikut:
- Seperti dialog tetapi muncul dari bawah layar aplikasi
- Menggunakan fungsi bawaan flutter showModalBottomSheet
- Membutuhkan dua properti, yaitu context dan builder

BottomSheet tambahan di aplikasi task management pada bagian task_screen.dart dan disambungkan ke profile_sheet.dart.