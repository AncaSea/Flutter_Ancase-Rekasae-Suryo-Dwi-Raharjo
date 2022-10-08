import 'package:animation/OnAnimation/Transition/transitionpage1.dart';
import 'package:animation/OnAnimation/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'OnAnimation/Transition/transitionpage2.dart' as contact_list;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => contact_list.ListContact())
    ],
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Section 23',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Animation & Transition'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const AnimationPage(),
                )),
              child: const Text('Animation Page')
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                    return const MyHomePageProvider();
                  },
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder:
                      (context, animation, anotherAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.ease;
                    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  }
                )
              ),
              child: const Text('Transition Page')
            ),
          ],
        ),
      )
    );
  }
}
