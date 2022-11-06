import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../form/login_form/formlog_body.dart';
import '../view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.color1, required this.color2, required this.color3});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late SharedPreferences loginData;
  bool remove = false;

  @override
  void initState() {
    removeDataUser();
    super.initState();
  }

  void removeDataUser() async {
    final sharedProv = Provider.of<GameStoreManager>(context, listen: false);
    loginData = await SharedPreferences.getInstance();
    remove = loginData.getBool('remove') ?? false;
    if (remove == true) {
      sharedProv.removeRegister();
    }
    // print('loginScreenRemove: $remove');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color1,
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: FormLogBody(color1: widget.color1, color2: widget.color2, color3: widget.color3,)),
    );
  }
}
