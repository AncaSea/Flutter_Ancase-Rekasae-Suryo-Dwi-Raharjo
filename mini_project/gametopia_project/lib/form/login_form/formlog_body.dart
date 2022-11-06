import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'form_button.dart';
import 'form_password.dart';
import 'form_usermail.dart';

class FormLogBody extends StatefulWidget {
  const FormLogBody({super.key,required this.color1, required this.color2,required this.color3});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<FormLogBody> createState() => _FormLogBodyState();
}

class _FormLogBodyState extends State<FormLogBody> {
  final _formKey = GlobalKey<FormState>();

  late SharedPreferences loginData;

  bool showUsermail = false;
  bool showPassword = false;

  TextEditingController usermail = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void initState() {
    setSharedLogin();
    super.initState();
  }

  Future setSharedLogin() async {
      loginData = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: widget.color3.withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black87, blurRadius: 10,
                    spreadRadius: 1, offset: Offset(0, 10))
              ]),
          height: 450,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormUsermail(
                          usermailController: usermail,
                          showUsermail: showUsermail),
                      FormLogPassword(
                          passwordController: pass, showPassword: showPassword),
                      ButtonLogForm(formKey: _formKey, usermail: usermail, pass: pass),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Not registered yet?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/registerpage');
                            },
                            child: Text(
                              'Create an account',
                              style: TextStyle(color: Colors.green[300]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
