import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class BadgesWidget extends StatelessWidget {
  const BadgesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Badges:'),
            const Chip(
              padding: EdgeInsets.all(0),
              backgroundColor: Colors.deepPurple,
              label: Text('BADGE', style: TextStyle(color: Colors.white)),
            ),
            Badge(
              toAnimate: false,
              shape: BadgeShape.square,
              badgeColor: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
              badgeContent:
                  const Text('BADGE', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}