import 'package:flutter/material.dart';

class EmptyScreenDataUser extends StatelessWidget {
  const EmptyScreenDataUser({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Icon(Icons.people_outline),
          const Text('Your user is empty'),
        ],
      ),
    );
  }
}