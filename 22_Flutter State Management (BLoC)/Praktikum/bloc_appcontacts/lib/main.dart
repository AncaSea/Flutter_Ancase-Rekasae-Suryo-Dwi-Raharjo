import 'package:bloc_appcontacts/bloc/contact/contact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login/bloc_login_bloc.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<ContactBloc>(
        create: (BuildContext context) => ContactBloc() ,
      ),
      BlocProvider<BlocLoginBloc>(
        create: (BuildContext context) => BlocLoginBloc() ,
      ),
    ],
    child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(title: 'Login'),
    );
  }
}