import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/register_model.dart';
import '../../vvm/view_model.dart';

class ButtonFormReg extends StatefulWidget {
  const ButtonFormReg({super.key,
    required this.formKey, required this.userNameController,
    required this.emailController, required this.passwordController});

  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<ButtonFormReg> createState() => _ButtonFormRegState();
}

class _ButtonFormRegState extends State<ButtonFormReg> {
  void showSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Sukses Register, Silahkan Login'),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(50),
      // duration: Duration(milliseconds: 100),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<GameStoreManager>(
      builder: (context, value, _) {
        return ElevatedButton(
          onPressed: () async {
            if (widget.formKey.currentState!.validate()) {
              // print('register test');
              final dataUserAdd = Register(
                widget.userNameController.text,
                widget.emailController.text,
                widget.passwordController.text,
              );
              value.addRegister(dataUserAdd, widget.userNameController.text,
                widget.emailController.text, widget.passwordController.text);
              showSnackBar(context);
              Navigator.pushNamed(context, '/');
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white70,
            padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
          ),
          child: Text('Sign up',
            style: TextStyle(
              color: Colors.green[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}