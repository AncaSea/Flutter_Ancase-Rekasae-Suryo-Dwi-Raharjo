import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task2/vvm/screens/landing_screen.dart';
import 'vvm/screens/datadetail_screen.dart';
import 'vvm/screens/home_screen.dart';
import 'vvm/screens/login_screen.dart';
import 'vvm/screens/profile_screen.dart';
import 'vvm/screens/register_screen.dart';
import 'vvm/view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => GameStoreManager())],
    child: const MyApp()));
}

class DetailGameArgument {
  final int? id;

  DetailGameArgument(this.id);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color cPrimary1 = const Color.fromARGB(255, 43, 48, 113);

  Color cPrimary2 = const Color.fromARGB(255, 55, 59, 145);

  Color cPrimary3 = const Color.fromARGB(255, 85, 92, 218);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GameTopia Game Store',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purple),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingScreen(color1: cPrimary1),
        '/loginpage': (context) =>
            LoginPage(color1: cPrimary1, color2: cPrimary2, color3: cPrimary3),
        '/registerpage': (context) => RegisterPage(
            color1: cPrimary1, color2: cPrimary2, color3: cPrimary3),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case DataDetailScreen.routeName:
            final args = settings.arguments as DetailGameArgument;
            return PageTransition(
                type: PageTransitionType.bottomToTop,
                duration: const Duration(milliseconds: 600),
                child: DataDetailScreen(
                  id: args.id,
                  color1: cPrimary1,
                  color2: cPrimary2,
                  color3: cPrimary3,
                ));
          case HomePage.routeName:
            return PageTransition(
              duration: const Duration(milliseconds: 600),
              child: HomePage(
                  color1: cPrimary1, color2: cPrimary2, color3: cPrimary3),
              type: PageTransitionType.leftToRightWithFade);
          case ProfilePage.routeName:
            return PageTransition(
              duration: const Duration(milliseconds: 600),
              child: ProfilePage(
                  color1: cPrimary1, color2: cPrimary2, color3: cPrimary3),
              type: PageTransitionType.rightToLeftWithFade);
          default:
            return null;
        }
      },
    );
  }
}
