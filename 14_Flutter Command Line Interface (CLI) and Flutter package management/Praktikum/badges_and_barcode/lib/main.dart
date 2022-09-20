import 'package:badges_and_barcode/badges_barcode/badges.dart';
import 'package:badges_and_barcode/badges_barcode/barcode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  int selectedIndex = 0;
  
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> widgetOptions = <Widget>[
    BadgesWidget(),
    Codebar()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Praktikum Section 14'),
        ),
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.badge_outlined),
              label: 'Badges',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'Barcode',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: onItemTapped,
        ),
      ),
    );
  }
}