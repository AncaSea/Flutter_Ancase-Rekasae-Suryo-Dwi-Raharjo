import 'package:flutter/material.dart';

class Stiker {
  IconData icon;
  Stiker(
    this.icon,
  );
}

// ignore: must_be_immutable
class GridViewWidget extends StatelessWidget {
  GridViewWidget({super.key});

  List<Stiker> stiker = [
    Stiker(
        Icons.wordpress_outlined),
    Stiker(
        Icons.wysiwyg),
    Stiker(
        Icons.accessible_forward_outlined),
    Stiker(
        Icons.access_time),
    Stiker(
        Icons.adb),
    Stiker(
        Icons.account_tree_rounded),
    Stiker(
        Icons.add_a_photo_rounded),
    Stiker(
        Icons.access_alarm_rounded),
    Stiker(
        Icons.account_balance_rounded),
    Stiker(
        Icons.ad_units_outlined),
    Stiker(
        Icons.account_balance_wallet),
    Stiker(
        Icons.ac_unit_outlined),
    Stiker(
        Icons.wrap_text_rounded),
    Stiker(
        Icons.account_circle_rounded),
    Stiker(
        Icons.zoom_in_outlined),
    Stiker(
        Icons.add),
    Stiker(
        Icons.wrong_location_rounded),
    Stiker(
        Icons.add_chart_sharp),
    Stiker(
        Icons.safety_check),
    Stiker(
        Icons.add_circle_rounded),
    Stiker(
        Icons.cabin),
    Stiker(
        Icons.back_hand),
    Stiker(
        Icons.nature_people_rounded),
    Stiker(
        Icons.hail_outlined),
    Stiker(
        Icons.tab_rounded),
    Stiker(
        Icons.pages),
    Stiker(
        Icons.icecream),
    Stiker(
        Icons.radio),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: stiker.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: CircleAvatar(
              radius: 25,
              child: Icon(stiker[index].icon, color: Colors.white,),
            ),
          );
        },
      ),
    );
  }
}