import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormUsermail extends StatefulWidget {
  FormUsermail(
      {super.key,
      // required this.usermail,
      required this.usermailController,
      required this.showUsermail});

  bool showUsermail;

  final TextEditingController usermailController;

  // String usermail;

  @override
  State<FormUsermail> createState() => _FormUsermailState();
}

class _FormUsermailState extends State<FormUsermail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        maxLines: 1,
        controller: widget.usermailController,
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              widget.showUsermail = true;
            });
          } else {
            setState(() {
              widget.showUsermail = false;
            });
          }
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          labelText: 'Username / Email',
          suffixIcon: widget.showUsermail
              ? IconButton(
                  onPressed: () {
                    widget.usermailController.clear();
                    setState(() {
                      widget.showUsermail = false;
                    });
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Username / Email tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }
}
