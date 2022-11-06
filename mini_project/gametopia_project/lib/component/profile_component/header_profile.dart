import 'package:flutter/material.dart';

class HeaderProfile extends StatefulWidget {
  const HeaderProfile({super.key, required this.color1, required this.color2, required this.color3});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<HeaderProfile> createState() => _HeaderProfileState();
}

class _HeaderProfileState extends State<HeaderProfile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [widget.color3, widget.color1]),
          borderRadius: const  BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: CircleAvatar(
              child: Icon(Icons.person, size: 70,)),
            ),
          )
        ],
    );
  }
}