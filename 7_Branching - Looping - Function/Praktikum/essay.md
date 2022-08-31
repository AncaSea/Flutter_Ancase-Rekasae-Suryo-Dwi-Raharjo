# Section 7 : ranching - Looping - Function

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## Task

### Task 1

>Buat fungsi yang terdapat sebuah nilai : <br>
a. jika nilai > 70 : return A <br>
b. jika nilai >40 : return B <br>
c. jika nilai > 0 : return C <br>
d. selain itu return teks kosong

Pada task 1 ini saya membuat konsep dalam pengambilan keputusan atau 
kondisi tersebut akan berdasarkan variabel nilai yang berupa angka 
secara random dari negatif 100 sampai 100.

Berikut adalah penulisan code yang saya kerjakan :

1. Pertama memgimport dart math untuk generate angka random

![import dart math](../Screenshots/Screenshot_importDart.png)

2. Kedua membuat fungsi untuk proses pengambilan keputusan

![fungsi pengambilan keputusan](../Screenshots/Screenshot_fungsiNilai.png)

3. Ketiga mendeklarasikan variabel random angka dan variabel untuk 
   menginisiasikan batas max dan min angka ke fungsi proses pengambilan 
   keputusan

![fungsi main](../Screenshots/Screenshot_fungsiMain.png)

### Task 2

>Tampilkan nilai faktorial dari : <br>
a. 10 <br>
b. 20 <br>
c. 30

Pada Task 2 pengerjaan saya menggunakan fungsi lain juga input parameter
untuk proses faktorisasi yang lebih simpel dan tidak menulis code proses 
faktorisasi berulang kali.

Berikut penulisan code yang saya buat :

1. Pertama membuat fungsi void hitungFaktorisasi dengan parameter int

   ![fungsi hitung faktorisasi](../Screenshots/Screenshot_fungsiHitungFaktorisasi.png)

    Di dalam fungsi hitungFaktorisasi terdapat variabel double yang berguna 
    untuk pengalian faktorisasi nilai yang diinputkan dan juga menyimpan 
    sementara hasil pengalian sampai dengan mendekati maksimal angka yang 
    diinputkan.
        Kemudian untuk proses pengalian faktorisasi menggunakan perulangan 
    For yang menggunakan variabel `i` untuk inisiasi awal, batas max perulangan,
    dan increment nilai. Dan didalamnya ada perkalian variabel faktorial 
    dan `i`. Terakhir tinggal menampilkan hasil faktorisasi.


2. Kedua void main dengan isi memanggil fungsi hitungFaktorisasi dan mengisi
   parameter tiga kali seperti pada soal

   ![fungsi main task 2](../Screenshots/Screenshot_fungsiMain2.png)