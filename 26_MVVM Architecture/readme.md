# Section 26 : MVVM Architecture

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 26 menjelaskan tentang apa itu MVVM Architecture, Keuntungan MVVM, Implementasi MVVM.

### **Pengertian MVVM**

>MVVM adalah singkatan dari Model View-View Model yang merupakan sebuah pola arsitektur yang memisahkan antara user interface logic dari business logic. Tujuan penggunaan MVVM sendiri adalah menjaga kode UI agar tetap sederhana dan tanpa mengandung app logic agar mudah untuk dikelola.

### **Keuntungan MVVM**

>MVVM mempunyai beberapa keuntungan yaitu:
1. Reusability, jika ada beberapa tampilan yang melakukan alur logic yang sama, mereka bisa menggunakan ViewModel yang sama
2. Maintainability, Mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic
3. Testability, Pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktivitas pada pengujian

### **Implementasi MVVM**

>Dalam Implementasi MVVM terlebih dahulu kita membuat struktur direktori, model, model API, ViewModel

### Struktur Direktori 

>Model memiliki 2 bagian, yaitu bentuk data yang akan digunakan dan sumber dari data tersebut. Tiap screen diletakkan dalam sebuah direktori yang didalamnya terdapat View dan ViewModel.

Berikut untuk susunan sturuktur nya:
```cs
lib
 |---model
 |   |----api
 |   |     |---contact_api.dart
 |   |
 |   |----contact_model.dart
 |
 |---screen
     |-----contact
           |------contact_screen.dart
           |------contact_view_model.dart   
```

### Model

>Bentuk data yang akan digunakan, dibuat dalam bentuk class. Data-data yang dimuat, diletakkan pada property

Berikut untuk bentuk model nya:
```cs
class Contact {
    final int id;
    final String name;
    final String phone;

    Contact({required this.id, required this.name, required this.phone});
}
```

### Model API

Untuk model API seperti dibawah ini:
```cs
class ContactAPI {
    static Future <List<Contact>> getContact() async {
        final response = await Dio()
            .get('https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts');
        
        List<Contact> contact = (response.data as List)
        .map((e) => Contact(id: e['id'], name: e['name'], phone: e[phone])).toList();

        return contacts;
    }
}
```

### ViewModel

>Menyimpan data-data dan logic yang diperlukan halaman ContactScreen. Jika widget lain memerlukan logic yang sama, dapat menggunakan ViewModel ini juga


Berikut untuk bentuk ViewModel nya:
```cs
class ContactViewModel with ChangeNotifier {

    List<Contact> _contacts = [];

    List<Contact> get contacts => _contacts;

    getAllContacts() async {
        final c = await ContactAPI.getContacts();
        _contacts = c;
        notifyListeners();
    }
}
```

### Mendaftarkan ViewModel

>Menggunakan MultiProvider agar dapat menggunakan banyak ViewModel. Lalu materialApp sebagai child utama

Berikut untuk cara mendaftarkan ViewModel nya:
```cs
runApp(
    MultiProvider(
        providers: [
            changeNotifierProvider(
                create: (_) => ContactViewModel();
            )
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false;
            home: ContactScreen(),
        ),
    ),
);
```

### View

Berikut untuk memanggil view provider di statefulwidget:
```cs
@override
void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp){
        Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    });
}
```

### Menampilkan Data di View

>Letakkan pada bagian build. Kemudian Menggunakan getters yang ada pada ViewModel dan data dapat langsung ditampilkan pada widgets

Berikut code nya:
```cs
final modelView = Providers.of<ContactViewModel>(context);

return Scaffold(
    appBar: AppBar(
        title: const Text('Contacts'), 
        ),
    body: ListView.builder(
        itemCount: countView.contacts.length,
        itemBuilder: (context, index) {
            final contact = modelView.contacts[index];
            return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phone),
            );
        },
    ) ,
);
```