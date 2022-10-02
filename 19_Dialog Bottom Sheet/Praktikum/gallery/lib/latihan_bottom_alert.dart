
import 'package:flutter/material.dart';
import 'package:gallery/latihan_hal_baru.dart';

void main() {
  runApp(const LatihanSect19());
}

class LatihanSect19 extends StatelessWidget {
  const LatihanSect19({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => LatihanBottomAlert(),
        'halBaru': (_) => const HalamanDua(),
      },

      // home: const LatihanBottomAlert(),
    );
  }
}

class LatihanBottomAlert extends StatefulWidget {
  LatihanBottomAlert({super.key});
  String judul = "Halaman pertama";

  @override
  State<LatihanBottomAlert> createState() => _LatihanBottomAlertState();
}

class _LatihanBottomAlertState extends State<LatihanBottomAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Bottom Alert'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('BottomSheet'),
                      content: const Text('Muncul?'),
                      actions: [
                        Center(
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return const Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      );  
                                    },
                                  );
                                },
                                child: const Text('Go')
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context, 'Nope'),
                                child: const Text('Nope')
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              }, 
              child: const Text('BottomAlert'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'halBaru', arguments: widget.judul),
              child: const Text('Halaman Kedua')
            ),
          ],
        ),
        
      ),
    );
  }
}