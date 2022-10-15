import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'vvm/screens/contact_screen.dart';
import 'vvm/screens/profile_screen.dart';
import 'vvm/view_model.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ViewModel(),
          ),
        ],
        child: const MaterialApp(
          home: Home(),
        )),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContactScreen(),
                      )
                    );
                  });
                },
                child: const Text('Contact Screen')
              ),
              ElevatedButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      )
                    );
                  });
                },
                child: const Text('Profile Screen')
              ),
            ]
          ),
        ),
      ),
    );
  }
}
