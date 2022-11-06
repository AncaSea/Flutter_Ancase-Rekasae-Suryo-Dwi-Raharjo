import 'package:flutter/material.dart';
import 'package:weekly_task2/form/register_form.dart/form_button.dart';
import 'form_email.dart';
import 'form_password.dart';
import 'form_username.dart';

class FormRegBody extends StatefulWidget {
  const FormRegBody({super.key, required this.color1, required this.color2, required this.color3});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<FormRegBody> createState() => _FormRegBodyState();
}

class _FormRegBodyState extends State<FormRegBody> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  bool showUsername = false;
  bool showEmail = false;
  bool showPassword = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
              boxShadow: const [BoxShadow(color: Colors.black87,
              blurRadius: 10, spreadRadius: 1, offset: Offset(0, 10))]
            ),
          height: 475,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Sign up',
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
                      FormRegUsername(userNameController: userNameController, showUsername: showUsername),
                      FormRegEmail(emailController: emailController, showEmail: showEmail),
                      FormRegPassword(passwordController: passwordController, showPassword: showPassword),
                      ButtonFormReg(formKey: _formKey, userNameController: userNameController, 
                        emailController: emailController, passwordController: passwordController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already registered?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context,'/loginpage',);
                            },
                            child: Text('Sign in',
                            style: TextStyle(color: Colors.green[300]),),
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