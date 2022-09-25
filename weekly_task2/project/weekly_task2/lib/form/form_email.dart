import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormEmail extends StatefulWidget {
  FormEmail({super.key,  required this.showEmail, required this.emailController,  required this.email});

  bool showEmail;
  final TextEditingController emailController;
  String email;

  @override
  State<FormEmail> createState() => _FormEmailState();
}

class _FormEmailState extends State<FormEmail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text('Email*')
        ),
        TextFormField(
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
            hintText: "contoh: Susilo@gmail.com",
            suffixIcon: widget.showEmail
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  widget.emailController.clear();
                  setState(() {
                    widget.showEmail = false;
                  });
                },
              )
            : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Email tidak boleh kosong';
            }
            return null;
          },
        ),
      ],
    );
  }
}