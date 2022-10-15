import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:storages/blocStrorage/bloc/storage_bloc.dart';
import 'package:storages/blocStrorage/register_bloc.dart';
import 'package:storages/providerStorage/register_provider.dart';
import 'providerStorage/provider.dart' as register;

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => register.ListRegister())
    ],
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StorageBloc>(
      create: (context) => StorageBloc()..add(Initial()),
      child: MaterialApp(
        title: 'Flutter Section 24',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Storage'),
      )
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
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RegisterProvider(),
                )),
              child: const Text('Provider Storage Page')
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                    return const RegisterBloc();
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
              child: const Text('BLoC Storage Page')
            ),
          ],
        ),
      )
    );
  }
}
