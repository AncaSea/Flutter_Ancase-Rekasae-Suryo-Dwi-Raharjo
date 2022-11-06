import 'package:flutter/material.dart';

class DrawerItem {
  String text;
  IconData icon;
  String rute;
  bool remove;

  DrawerItem(
    this.text,
    this.rute,
    this.icon,
    this.remove
  );
}
