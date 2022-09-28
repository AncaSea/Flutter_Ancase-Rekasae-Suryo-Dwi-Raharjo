import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan'),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 5,
              child: Container(
                width: double.infinity,
                color: Colors.red,
              ),
            ),
            Flexible(
              flex: 6,
              child: Container(
                width: double.infinity,
                color: Colors.yellow,
              ),
            ),
            Flexible(
              flex: 7,
              child: Container(
                width: double.infinity,
                color: Colors.green,
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 400,
            //   color: Colors.yellow,
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 500,
            //   color: Colors.purple,
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 600,
            //   color: Colors.cyan,
            // ),
          ],
        ),
      ),
    );
  }
}
