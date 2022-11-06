import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../vvm/screens/home_screen.dart';
import '../../vvm/view_model.dart';
import 'actions/alert_form.dart';

class ButtonLogForm extends StatefulWidget {
  const ButtonLogForm({super.key,
    required this.formKey, required this.usermail, required this.pass});

  final GlobalKey<FormState> formKey;
  final TextEditingController usermail;
  final TextEditingController pass;

  @override
  State<ButtonLogForm> createState() => _ButtonLogFormState();
}

class _ButtonLogFormState extends State<ButtonLogForm> {
  
  void setIsLogin() async {
    final loginData = await SharedPreferences.getInstance();
    loginData.setBool('isLogin', true);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameStoreManager>(
    builder: (context, value, _) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ElevatedButton(
          onPressed: () {
            if (widget.formKey.currentState!.validate()) {
              final user = value.listregister.where(
                (data) => widget.usermail.text == (data.nama)).isNotEmpty;
              final mail = value.listregister.where((data) =>
                          widget.usermail.text == (data.email)).isNotEmpty;
              final pwd = value.listregister.where(
                (data) => widget.pass.text == (data.password)).isNotEmpty;
              if (user && pwd || mail && pwd) {
                final dataUserByName = value.listregister.where((data) =>
                  data.nama.contains(widget.usermail.text)).toList();
                final dataUserByMail = value.listregister.where((data) =>
                  data.email.contains(widget.usermail.text)).toList();
                dataUserByName.isNotEmpty ?
                  value.updatePreferences(
                    dataUserByName.first.nama, dataUserByName.first.email, dataUserByName.first.password)
                : value.updatePreferences(
                    dataUserByMail.first.nama, dataUserByMail.first.email, dataUserByMail.first.password);
                  setIsLogin();
                // print('isLoginForm: ${loginData.getBool('isLogin')}');
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              } else {
                // print('login error');
                showDialog(
                  context: context,
                  builder: (context) => const AlertLogForm()
                );
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white70,
            padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
          ),
          child: Text(
            'Sign in',
            style: TextStyle(
              color: Colors.green[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    },
  );
  }
}