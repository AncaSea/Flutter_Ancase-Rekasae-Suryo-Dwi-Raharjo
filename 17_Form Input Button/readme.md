# Section 17 : Form Input Button

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 17 membahas tentang beberapa widget yang membentuk sebuah Form widget seperti input dan button.

Berikut adalah materi yang diberikan :

### **Form**

>Form pada Flutter adalah sebuah widget yang berfungsi untuk mempermudah dalam proses pembuatan dan memberi keamanan lebih pada aplikasi flutter seperti validasi, dan aksi lainnya yang umum terdapat pada sebuah form.

Form secara umum berfungsi menerima isian data dari pengguna dan isian data nya dapat lebih dari satu.

Cara pembuatan form dapat dilihat dari kriteria berikut:
- Menggunakan StatefulWidget
- Disimpan menggunakan `GlobalKey<FormState>`

Contoh tampilan code nya:
```cs
var formKey = GlobalKey<FormState>();

Form(
    key: formKey,
    child: inputWidgets,
)
```

### **Input**

>input seperti namanya adalah widget yang dapat di isi data oleh pengguna dan berguna untuk menerima serta membaca inputan dari pengguna. Input dapat menerima isian data lebih dari satu.

Input mempunyai beberapa jenis, salah satu contohnya adalah widget TextField, Radio, Checkbox, dan dropdownButton. 

#### TextField

Cara kerja TextField ini kita harus menginisiasi controller untuk nya agar TextField bisa membaca inputan dari pengguna. Inputan isian yang bisa dibaca TextField juga berupa teks.

Berikut bentuk penggunaan input TextField:
```cs
var inputController = TextEdittingController();

TextField(
    controller: inputController,
);
```

#### Radio

>Radio atau RadioButton adalah widget yang memungkinkan pengguna untuk memilih single item dari daftar opsi yang ditampilkan.

Cara kerja Radio, data diambil menggunakan property dengan tipe data sesuai value pada radio. Bentuk penulisan untuk menggunakan Radio sebagai berikut:
```cs
var radioValue = '';

Radio<String>(
    value: 'Laki-laki',
    groupValue: radioValue,
    onChanged: (String? value) {
        setState((){
            radioValue = value ?? '';
        });
    },
);
```

#### Checkbox

>Seperti Radio, Checkbox memungkinkan pengguna memilih item dari daftar opsi yang ditampilkan. Hanya saja Checkbox dapat memilih lebih dari satu item. Data yang diambil menggunakan property bertipe bool.

Berikut penulisan penggunaan Checkbox:
```cs
var checkValue = false;

Checkbox(
    value: checkValue,
    onChanged: (bool? value) {
        setState((){
            checkValue = value ?? false;
        });
    },
);
```

#### DropdownButton

>Dropdown adalah fitur yang bisa menampung beberapa list dengan tampilan muncul kebawah. Jadi DropdownButton adalah widget pada Flutter yang muncul jika ditekan dan menampung beberapa pilihan yang memberi opsi ke pengguna untuk memilih satu opsi.

Pembuatan DropdownButton adalah dengan mengambil data menggunakan property dengan tipe data sesuai value pada DropdownMenuItem. Berikut bentuk penulisan code nya:
```cs
var dropdownValue = 0;

DropdownButton(
    value: dropdownValue,
    onChanged: (int? value) {
        setState((){
            dropdowValue = value ?? 0;
        });
    },
    items: const [
        DropdownMenuItem(
            value: 0,
            child: Text('Pilih ...'),
        ),
        DropdownMenuItem(
            value: 1,
            child: Text('Satu'),
        ),
        DropdownMenuItem(
            value: 2,
            child: Text('Dua'),
        ),
        DropdownMenuItem(
            value: 3,
            child: Text('Tiga'),
        ),
    ],
);
```

### **Button**

>Button adalah sebuah widget yang bersifat sebagai tombol yagn dapat mempunyai fungsi saat ditekan oleh pengguna.

Ada beberapa macam Button yang dapat digunakan di Flutter, antara lain:

#### ElevatedButton

>ElevatedButton adalah tombol yang mempunyai tampilan timbul dan dapat ditambahi teks.

Penulisan code nya sebagai berikut:
```cs
ElevatedButton(
    child: const Text('Submit'),
    onPressed: () {
        // perintah code saat ditekan
    },
);
```

#### IconButton

>IconButton adalah Button yang hanya menampilkan icon atau gambar icon saja tanpa teks.

Contoh penulisan code nya sebagai berikut:
```cs
IconButton(
    child: const Icon(Icons.add),
    onPressed: () {
        // perintah code saat ditekan
    },
);
```

---
