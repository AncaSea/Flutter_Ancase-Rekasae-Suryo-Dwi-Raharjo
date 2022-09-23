import 'package:flutter/material.dart';

class RouteTwo extends StatelessWidget {
  const RouteTwo({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () => Navigator.pop(context),
            splashRadius: 30,
          ),
          title: const Text('Detail Gambar'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(image),
            ),
          ),
        ),
      ),
    );
  }
}