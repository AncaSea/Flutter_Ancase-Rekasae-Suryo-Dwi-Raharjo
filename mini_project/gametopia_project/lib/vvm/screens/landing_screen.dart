import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weekly_task2/vvm/screens/home_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key, required this.color1});

  final Color color1;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    final SharedPreferences loginData = await SharedPreferences.getInstance();
    final checkLogin = loginData.getBool('isLogin') ?? false;

    if (checkLogin == true) {
      Future.delayed(const Duration(seconds: 0), () {
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.routeName, ModalRoute.withName(HomePage.routeName));
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/loginpage', ModalRoute.withName('/loginpage'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color1,
      body: const Center(child: CircularProgressIndicator()));
  }
}