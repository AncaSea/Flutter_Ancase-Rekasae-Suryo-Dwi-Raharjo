# Section 22 : Flutter State Management (BLoC)

## Data Diri

> Nomor Urut  : 1_007fFLC_0 <br>
Nama        : Ancase Rekasae Suryo Dwi Raharjo

--- 

<br>

## **Summary**

>Section 22 menjelaskan tentang state management declarative ui, pendekatan state management, BLoC

### **Declarative UI**

>Declarative UI merupakan sifat Flutter yang artinya membangun UI nya pada screen untuk mencerminkan keadaan state saat ini.

Kemudian state adalah sebuah widget sedang aktif dan widget tersebut menyimpan data di memori. Flutter akan membangun ulang UI nya ketika ada state atau data yang berubah. Ada 2 jenis state dalam Flutter yaitu:
- Ephemeral state
  >Ephemeral state tidak memerlukan state management yang kompleks, karena hanya membutuhkan StatefulWidget dengan menggunakan fungsi setState(). Dan ephemeral state digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses data widget nya,
  
  contohnya:
  - PageView
  - BottomNavigationBar
  - Switch Button
- App state
  >App state digunakan ketika bagian yang lain suatu aplikasi membutuhkan akses ke data state widget, 
  
  contohnya:
  - Login info
  - Pengaturan preferensi pengguna
  - Keranjang belanja, dimana informasi yang pengguna pilih di suatu screen yang mana informasi itu akan muncul di screen yang berbeda

### **Pendekatan State Management**

Jika pada pendekatan State Management mana yang lebih baik?<br> sebenarnya sesuai kebutuhan dan keadaan, seperti:
- setState
  >Lebih cocok penggunaan nya pada ephemeral state
- Provider
  >Penggunaan untuk state management yang lebih kompleks seperti app state
- BLoC
  >Menggunakan pola stream/observable, untuk memisahkan UI dengan bisnis logic nya

### **BLoC**

>BloC merupakan singkatan dari Business Logic Component. BLoC adalah design pattern yang membantu untuk memisahkan presentation dengan business logic. BLoC mempunyai kegunaan untuk memisahkan antara business logic dengan UI.

Ada beberapa alasan kenapa menggunakan BLoC, antara lain:
- Simple
- Powerful
- Testable

Untuk memahami BLoC, mengetahui cara kerja BLoC merupakan langkah yang tepat. Berikut merupakan cara kerja BLoC:
- Menerima event sebagai input
- Dianalisa dan dikelola di dalam BLoC
- Menghasil state sebagai output

Lalu ada yang namanya Stream, yang merupakan rangkaian proses secara asynchronous dan actor utama di dalam BLoC.

Langkah-langkha menggunakan BLoC:
- Menginstall package dan membuat file counter_bloc.dart, counter_event.dart, counter_state.dart
  ```cs
  dependencies:
    flutter:
        sdk: flutter
        flutter_bloc: ^8.0.1
        equatable: ^2.0.3 //mencegah rebuild yang tidak perlu
  ```
- Menambahkan event di counter_event.dart
  ```cs
  abstract class CounterEvent extends Equatable {
    const CounterEvent();

    @override
    List<Object> get props => [];
  }

  class Increment extends CounterEvent {}

  class Decrement extends CounterEvent {}
  ```
- Menambahkan state di counter_state.dart
  ```cs
  class CounterState extends Equatable {
    int value = 0;
    CounterState(this.value);

    @override
    List<Object> get props => [value];
  }
  ```
- Menambahkan logika bisnis di counter_bloc.dart
  ```cs
  class CounterBloc extends Bloc<CounterEvent, CounterState> {
    CounterBloc() : super(CounterState(0)) {
        on<Increment>((event, emit) => emit(CounterState(state.value + 1)));
        on<Decrement>((event, emit) => emit(CounterState(state.value - 1)));
    }
  }
  ```
- Menambahkan BlocProvider main.dart
  ```cs
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
        create: (context) => CuonterBloc(),
        child: MaterialApp(
            debugShowcheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.orange,
            ),
            home:   const HomePage()
        ),
    );
  }
  ```
- Membangun UI di home.dart
  ```cs
  class HomePage extends StatelessWidget {
    const HomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Latihan Bloc'),
                centerTitle: true,
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        const Text(
                            '0',
                            style: TextStyle(fontSize: 50),
                        ),
                        const SizedBox(
                            height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('Increment'),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('Decrement'),
                        ),
                    ],
                ),
            ),
        )
    }
  }
  ```
- Menambahkan BlocBuilder di body home.dart
  ```cs
  body: BlocBuilder<CounterBloc, CounterState>(
    builder: (context, state) {
        return Center(
            child: Column(
  ```
- Mengganti text dengan nilai terbaru yang dimiliki state
  ```cs
  Text(
    '${state.value}',
    style: const TextStyle(fontSize: 50),
  )
  ```
- Menambahkan context.read pada onPressed ElevatedButton
  ```cs
  ElevatedButon(
    onPressed: () {
        context.read<CounterBloc>().add(Increment());
    },
    child: const Text('Increment'),
  ),
  ElevatedButon(
    onPressed: () {
        context.read<CounterBloc>().add(Decrement());
    },
    child: const Text('Decrement'),
  ),
  ```