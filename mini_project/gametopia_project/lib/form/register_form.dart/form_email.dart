import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormRegEmail extends StatefulWidget {
  FormRegEmail(
      {super.key,
      // required this.Regemail,
      required this.emailController,
      required this.showEmail});

  bool showEmail;

  final TextEditingController emailController;

  // String Regemail;

  @override
  State<FormRegEmail> createState() => _FormRegEmailState();
}

class _FormRegEmailState extends State<FormRegEmail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        maxLines: 1,
        controller: widget.emailController,
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              widget.showEmail = true;
            });
          } else {
            setState(() {
              widget.showEmail = false;
            });
          }
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          labelText: 'Email',
          suffixIcon: widget.showEmail
            ? IconButton(
                onPressed: () {
                  widget.emailController.clear();
                  setState(() {
                    widget.showEmail = false;
                  });
                },
                icon: const Icon(Icons.clear),
              )
            : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'email tidak boleh kosong';
          }
          final mailValid = EmailValidator.validate(value);
          if (!mailValid) {
            return 'struktur email tidak valid';
          }
          return null;
        },
      ),
    );
  }
}
