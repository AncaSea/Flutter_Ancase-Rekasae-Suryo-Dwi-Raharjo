import 'package:flutter/material.dart';
import 'package:weekly_task2/vvm/screens/aboutus/about_us_header.dart';
import 'package:weekly_task2/vvm/screens/aboutus/about_us_list.dart';

// ignore: must_be_immutable
class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

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
          title: const Text('About Us')
        ),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            const AboutUsHeader(),
            AboutUsListItem()
          ],
        ),
      ),
    );
  }
}
