import 'package:flutter/material.dart';
import 'package:weekly_task1/section/contact_us_section.dart';
import 'package:weekly_task1/section/welcome_section.dart';

void main() {
  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/favpng_bus-icon.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.all(8.0), child: const Text('Booking Bus Online')
              ),
            ],
          ),
        ),
        body: ListView(
          children: const <Widget>[
            WelcomeSection(),
            ContactUsSection(),
          ],
        ),
      ),
    );
  }
}