# Section 27 : Finite State Machines

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 27 menjelaskan tentang pengertian Finite State Machine, Implementasi pada View-Model dan Widget, Unit Test, dan Mocking.

### **Pengertian Finite State Machine**

>Finite State Machine adalah mesin yang memiliki sejumlah state. Dan tiap state menunjukkan apa yang terjadi sebelumnya.

Contoh terdapat 3 state yang menunjukkan kejadian dalam suatu proses:
1. IDLE, state saat tidak terjadi proses
2. RUNNING, state saat proses sedang berjalan
3. ERROR, state saat proses gagal diselesaikan

### **Implementasi pada View-Model**

Pertama-tama membuat enum untuk masing-masing state:
- none, untuk saat state IDLE
- loading, untuk saat state RUNNING
- error, untuk saat state ERROR

Kemudian menambahkan getter-setter untuk menyimpan state dari widget
```cs
class ContactViewModel with ChangeNotifier {
    ContactViewModel _state = ContactViewState.none;
    ContactViewModel get state => _state;

    changeState(ContactViewState s) {
        _state = s;
        notifyListeners();
    }
}
```

Lalu menggunakan state di tiap proses yang perlu state tersebut, dapat memanfaatkannya
```cs
class ContactViewModel with ChangeNotifier {
    getAllContacts() async {
        changeState(ContactViewState.loading);

        try {
            final c = await ContactAPI.getAllContacts();
            _contacts = c;
            notifyListeners();
            changeState(ContactViewState.none);
        } catch (e) {
            changeState(ContactViewState.error);
        }   
    }
}
```

### **Implementasi pada Widget**

Pada implementasi ini, informasi finite state dapat berguna untuk menentukan seperti apa tampilan yang dimunculkan, berikut code nya:
```cs
Widget body(ContactViewModel viewModel) {
    final isLoading = viewModel.state == ContactViewState.loading;
    final isError = viewModel.state == ContactViewState.error;

    if(isLoading) {
        return const Center(child: CircularProgressIndicator());
    }

    if(isError) {
        return const Center(child: Text('Gagal mengambil data.'));
    }

    return listView(viewModel);
}
```

### **Unit Test**

>Unit test salah satu jenis pengujian pada perangkat lunak. Pengujian dilakukan pada unit dalam perangkat lunak, unit yang dimaksud umumnya adalah fungsi atau method.

Unit Test mempunyai tujuan memastikan fungsi dapat mengolah berbagai jenis input, memastikan hasil dari suatu fungsi atau method sudah selesai, dan juga untuk menjadi dokumentasi.

Dalam melakukan unit test terdapat 2 cara yaitu:
1. Manual, unit dijalankan dan dicek hasilnya secara manual.
2. Automated, menulis script yang dapat dijalankan berkali-kali menggunakan test runner.

Berikut implementasi untuk unit test:
- Menambah test di Dependencies
  ```cs
  dev_dependencies:
    test:
  ```
- Membuat file test <br>
  Membuat folder test, tambahkan folder baru model/api lalu di dalam nya dibuat file contact_api_test.dart
- Menulis test script
  ```cs
  import 'package:test/test.dart';

  void main() {
    test('get all contacts returns data', () async {
        var contacts = await ContactAPI.getAllContacts();
        expect(contacts.isNotEmpty, true);
    });
  }
  ```
- Menjalankan test <br>
  Caranya dengan menggunakan perintah flutter test di terminal
- Mengelompokkan test <br>
  Untuk test yang dengan subjek yang sama dikelompokkan dalam sebuah kelompok dengan menggunakan Group
  ```cs
  import 'package:test/test.dart';

  void main() {
    group('ContactAPI', () {
        test('get all contacts returns data', () async {
            var contacts = await ContactAPI.getAllContacts();
            expect(contacts.isNotEmpty, true);
        });
    });
  ```

### **Mocking**

>Mocking merupakan teknik untuk menghindari masalah interupsi proses pengujian jika proses terikat dengan sistem eksternal karena dapat mempengaruhi berjalannya pengujian.

Cara kerja Mocking seperti berikut:
- Suatu object dibuat bentuk tiruannya
- Bentuk tiruan tersebut memiliki input dan output yang sama dengan yang asli
- Bentuk tiruan menghilangkan ketergantungan pada sistem eksternal

Untuk implementasi dari Mocking, adalah seperti berikut:
- Menambahkan mockito dan build runner di dependencies
- Tidak menggunakan static pada fungsi
- Memasang annotation untuk membuat mock dengan mengimport mockito.dart dan menambahkan code `@GenerateMocks([ContactAPI])`
- Membuat file mock dengan menjalankan perintah `flutter pub run build_runner build`
- Menggunakan mock yang telah dibuat dengan cara:
  ```cs
  import 'package:test/test.dart';
  import 'package:mockito/mockito.dart';
  import 'package:mockito/annotation.dart';
  import 'contac_api_test.mocks.dart'; // import mock
  
  @GenerateMocks([ContactAPI])
  void main() {
    group('ContactAPI', () {
        ContactAPI contactAPI = MockContactAPI(); // membuat objeck mock

        test('get all contacts returns data', () async {
            // membuat persiapan mock
            when(contactAPI.getAllContacts()).thenAnswer(
                (_) async => <Contact>[
                    Contact(id: 1, name: 'a', phone: '0'),
                ],
            );
            var contacts = await ContactAPI.getAllContacts();
            expect(contacts.isNotEmpty, true);
        });
    });
  ```
  
---