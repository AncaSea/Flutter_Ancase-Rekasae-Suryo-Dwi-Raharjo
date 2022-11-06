import 'package:flutter/material.dart';
import '../../form/register_form.dart/formreg_body.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.color1, required this.color2, required this.color3});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color1,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: FormRegBody(color1: widget.color1, color2: widget.color2, color3: widget.color3,)
      ),
    );
  }
}
