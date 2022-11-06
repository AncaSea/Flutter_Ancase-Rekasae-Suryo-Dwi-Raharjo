import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormLogPassword extends StatefulWidget {
  FormLogPassword(
      {super.key,
      required this.passwordController,
      required this.showPassword});

  bool showPassword;

  final TextEditingController passwordController;

  @override
  State<FormLogPassword> createState() => _FormLogPasswordState();
}

class _FormLogPasswordState extends State<FormLogPassword> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        maxLines: 1,
        obscureText: true,
        controller: widget.passwordController,
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              widget.showPassword = true;
            });
          } else {
            setState(() {
              widget.showPassword = false;
            });
          }
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock),
          labelText: 'Password',
          suffixIcon: widget.showPassword
              ? IconButton(
                  onPressed: () {
                    widget.passwordController.clear();
                    setState(() {
                      widget.showPassword = false;
                    });
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }
}
