import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Image(
            image: AssetImage('assets/welcomeImage.jpg'),
          ),
          Text(
            'Welcome To The Jungle!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}