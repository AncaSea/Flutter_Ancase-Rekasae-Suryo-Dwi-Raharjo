import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("H:m:s").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Text('Flutter'),
        ),
        body: Center(
          child: TimerBuilder.periodic(const Duration(seconds: 1),
          builder: (context) {
            return Text(
              getSystemTime(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 231, 44, 131),
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            );
          }),
        ),
      ),
    );
  }
}