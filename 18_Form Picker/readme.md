# Section 18 : Form Picker

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 18 membahas tentang basic layouting dari form dan advance user input.

### **Basic Layouting Form**

>Pada Basic Layouting Form mencakup tentang materi Row and Column, MainAxisSize, MainAxisAlignment, CrossAxisAlginment, Flexible Widget, Expanded Widget.

#### 1. Row and Column

>Row atau baris digunakan untuk meletakkan widget children nya secara horizontal. Sedangkan Column atau kolom digunakan untuk meletakkan widget children secara vertikal.

Berikut penggunaan code untuk Row:
```cs
Row(
    children: const [
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```
Berikut code untuk Column:
```cs
Column(
    children: const [
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ],
),
```

#### 2. MainAxisSize

>MainAxisSize merupakan property dalam beberapa widget seperti Container. Digunakan untuk menentukan seberapa banyak space menempati main axis. <br> Main axis disini adalah horizontal(Row) dan vertical(Column). Main axis juga memiliki dua property yaitu MainAxisSize.max dan MainAxisSize.min

Perbedaan MainAxisSize.max dan MainAxisSize.min adalah
- MainAxisSize.max menempati semua space dari main axis
- MainAxisSize.min tidak memiliki extra space, hanya untuk children nya saja

Berikut implementasi code main axis max dan min nya:
```cs
Row(
    mainAxisSize: MainAxisSize.max
    children: const [
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ]
),
Column(
    mainAxisSize: MainAxisSize.min
    children: const [
        BlueBox(),
        BlueBox(),
        BlueBox(),
    ]
)
```

#### 3. MainAxisAlignment

>MainAxisAlignment merupakan property yang digunakan Row dan Column untuk memposisikan children mereka di extra space yang ada.

Main axis alignment memiliki 6 values:
- MainAxisAlignment.start
- MainAxisAlignment.end
- MainAxisAlignment.center
- MainAxisAlignment.spaceBetween
- MainAxisAlignment.spaceEvenly
- MainAxisAlignment.spaceAround

#### 4. CrossAxisAlignment

>Property ini digunakan pada Row dan Column untuk memposisikan children mereka pada cross axis. Seperti main axis, cross axis ada vertikal dan horizontal.

CrossAxisAlignment memiliki 5 values:
- CrossAxisAlignment.start
- CrossAxisAlignment.end
- CrossAxisAlignment.center
- CrossAxisAlignment.stretch
- CrossAxisAlignment.baseline

#### 5. Flexible Widget

>Flexible adalah widget yang membungkus widget lain sehingga child dari flexble widget menjadi flexible atau resizeable. Flexible sangat berguna jika ingin membuat aplikasi responsive dan harus ada dalam turunan parent widget Row dan Column. Perubahan ukuran Flexible ditentukan dengan property fit dan flex.

Fit Property digunakan untuk flexible widget menentukan memenuhi extra space yang tersedia di main axin nya. Fit property menerima nilai values berupa:
- FlexFit.loose yang akan memiliki ukuran minimum
- FlexFit.tight yang akan memiliki ukuran maximum

Contoh penggunaan Flexible widget:
```cs
Row(
    children: const [
        BlueBox(text: 'A'),
        Flexible(
            fit: FlexFit.tight,
            child: BlueBox(text: 'B'),
        ),
        Flexible(
            fit: FlexFit.loose,
            child: BlueBox(text: 'C'),
        ),
    ],
),
```

Flex Property digunakan untuk menentukan perbandingan ukuran dari child widget nya atau flex properti lain. Flex menerima nilai values berupa integer.

Contoh penggunaan Flex properti:
```cs
Row(
    children: const [
        BlueBox(text: 'A'),
        Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: BlueBox(text: 'B'),
        ),
        Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: BlueBox(text: 'C'),
        ),
    ],
)
```

#### 6. Expanded Widget

>Widget yang membungkus widget lain sehingga ukuran dari child Expanded akan dipaksa untuk memenuhi ruang yang tersedia. Widget ini juga berguna jika ingin membuat aplikasi responsif. Expanded juga memiliki default value FlexFit.tight dan untuk perubahan ukuran ditentukan oleh properti flex.

Contoh penggunaan Expanded Widget:
```cs
Row(
    children: const [
        Expanded(
            flex: 1,
            child: BlueBox(text: 'A'),
        ),
        Expanded(
            flex: 2,
            child: BlueBox(text: 'B'),
        ),
        Expanded(
            flex: 3,
            child: BlueBox(text: 'C'),
        ),
    ],
),
```

---

### **Advance User Input**

>Pada materi ini akan  mencakup tentang Date Picker, Color Picker, dan File Picker.

Advance User Input ini digunakan interaksi antara aplikasi dan user sebagai sarana mengumpulkan input dan feedback dari user.

#### 1. Date Picker

>Date Picker adalah widget dimana user bisa memasukkan tanggal, seperti tanggal lahir, waktu pemesanan tiket, waktu reservasi restoran, jadwal meeting, dll.

Cara membuat date picker:
- Pertama menambahkan packages intl di pubspec.yaml
    ```cs
    dependencies:
        flutter:
            sdk: flutter
        intl: ^0.17.0
    ```
- Mempersiapkan variabel
  ```cs
  class _HomePageState extends State<HomePage> {
    DateTime _dueDate = DateTime.now();
    final currentDate = DateTime.now();
  }
  ```
- Membangun UI
  ```cs
  Column(
    children: [
        Row(
            children: [
                const Text('Date'),
                TextButton(
                    child: const Text('Select'),
                    onPressed: () {

                    },
                ),
            ],
        ),
    ],
  );
  ```
- Menambahkan fungsi showDatePicker di dalam onPressed
  ```cs
  onPressed() {
    final selectDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(currentDate.year + 5),
    );
  }
  ```
- Memanggil fungsi setState didalam onPressed
  ```cs
  setState(() {
    if(selectDate != null) {
        _dueDate = selectDate;
    }
  });
  ```

#### 2. Color Picker

>Color Picker adalah widget dimana user bisa memilih berbagai macam warna dan penggunaan nya bisa untuk berbagai macam kondisi.

Cara membuat color picker:
- Menambahkan packages flutter_colorpicker di pubspec.yaml
  ```cs
  dependencies:
    flutter:
        sdk: flutter
    flutter_colorpicker: ^1.0.3
  ```
- import packages flutter_colorpicker
  ```cs
  import 'package:flutter_colorpicker/flutter_colorpicker.dart';
  ```
- Mempersiapkan widget
  ```cs
  Color _currentColor = Colors.orange;
  ```
- Membangun UI
  ```cs
  Column(
    children: [
        const Text('Color'),
        Container(
            height: 100,
            width: double.infinity,
            color: _currentColor,
        ),
        Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_currentColor),
                ),
                child: const Text('Pick Color'),
                onPressed() {

                },
            ),
        ),
    ],
  );
  ```
- Menambahkan fungsi showDialog di dalam onPressed dengan return widget AlertDialog
  ```cs
  showDialog(
    context: context,
    builder: (context) {
        return AlertDialog(
            title: const Text('Pick Your Color').
            action: [
                TextButton(
                    onPressed: () {
                        Navigator.pop(context);
                    },
                    child: const Text('Save'),
                ),
            ],
        ),
    },
  );
  ```
- Membuat kode untuk penggunaan packages flutter_colorpicker di dalam AlertDialog
  ```cs
  return AlertDialog(
    title: const Text('Pick Your Color'),
    content: BlockPicker(
        pickerColor: _currentColor,
        onColorChanged: (color) {
            setState (() {
                _currentColor = color;
            });
        },
    ),
  ),
  ```

#### 3. File Picker

>File Picker merupakan widget yang mempunyai fungsi mengakses storage untuk memilih dan membuka file.

Cara membuat File Picker:
- Menambahkan packages file_picker dan opern_file di pubspec.yaml
  ```cs
  dependencies:
    flutter:
        sdk: flutter
    file_picker: ^4.3.3
    open_file: ^3.2.1
  ```
- Mengimport packages file_picker dan open_picker
  ```cs
  import 'package:file_picker/file_picker.dart';
  import 'package:open_picker/open_picker.dart';
  ```
- Membangun UI
  ```cs
  Column(
    children: [
        const Text('Pick Files'),
        Center(
            child: ElevatedButton(
                child: const Text('Pick and Open File'),
                onPressed: () {

                },
            ),
        ),
    ],
  );
  ```
- Membuat fungsi untuk explore dan memilih files
  ```cs
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
  }
  ```
- Memanggil fungsi _pickFile di dalam onPressed
  ```cs
  Center(
    child: ElevatedButton(
        child: const Text('Pick and Open File'),
        onPressed: () {
            _pickFile();
        },
    ),
  ),
  ```
- Membuat fungsi untuk membuka file yang telah dipilih
  ```cs
  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
  ```
- Mengambil file dari object return dan memanggil fungsi _openFile di dalam fungsi _pickFile
  ```cs
  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }
  ```

  ---
  