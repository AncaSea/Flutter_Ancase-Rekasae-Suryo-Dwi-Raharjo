# Section 25 : Introduction REST API – JSON serialization/deserialization

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 25 menjelaskan tentang REST API, HTTP, Dio, serialisasi dan deserialisasi JSON.

### **REST API**

>REST API merupakan singkatan dari Representational State Transfer Application Programming Interface. Rest API ini sebagai arsitektural yang memisahkan tampilan dengan proses bisnis. Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request.

### **HTTP**

>HTTP adalah protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web.

Pola komunikasi HTTP adalah sebagai berikut:
- Client mengirim request
- Server mengolah dan membalas dengan memberi response

Untuk struktur request pada HTTP sendiri meliputi:
1. URL
   - Adalah alamat yang akan diakses
2. Method
   - Menunjukkan aksi yang dikirim. Method ada beberapa macam seperti PUSH, GET, PUT, DELETE
3. Header
   - Informasi tambahan terkait request yang dikirimkan
4. Body
   - Data yang disertakan bersama request

Selanjutnya struktur untuk response meliputi:
1. Status Code
   - Kode yang mewakilkan kesuluruhan response, baik sukses maupun gagal
2. Header
   - Informasi tambahan terkait response yang diberikan
3. Body
   - Data yang disertakan bersama request

### **Dio**

>Dio ini merupakan package pada Flutter yang menyediakan klien HTTP yang kuat untuk Dart dan Flutter dan mendukung Interceptors, konfigurasi Global, FormData, Pembatalan Permintaan, Pengunduhan File, Timeout, dll. Tentunya Dio dimanfaatkan untuk melakukan REST API.

Berikut contoh penggunaan dio dari instalasi sampai penggunaan:
1. Tambahkan dependecy pada pubspec.yaml
2. Menjalankan perintah flutter pub get pada terminal
3. Mengambil data menggunakan Dio dan menampilkan hasilnya pada console, contoh:
   ```cs
   Dio()
    .get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts')
    .then((response) {
        print(response);
    })
   ```

### **Serialisasi dan Deserialisasi JSON**

>Pertama JSON singkatan dari Javascript Object Notation cara penulisan data yang umum digunakan pada REST API 

Serialisasi JSON adalah mengubah struktur data ke bentuk JSON, contoh Map/List di-serialisasi menjadi JSON. Untuk men-serialisasi menggunakan jsonEncode dari package `dart:convert`, contoh:
```cs
void main() {
    var dataMap = { ... };
    var dataJSON = jsonEncode(dataMap);
    print(dataJSON);
}
```

Deserialisasi JSON adalah mengubah JSON ke bentuk struktur data. Deserialisasi menggunakan fungsi jsonDecode dari package `dart:convert`, contoh:
```cs
void main() {
    var dataJSON = ' ... ';
    var dataMap = jsonEncode(dataJSON);
    print(dataJSON);
}
```

---