import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormRegUsername extends StatefulWidget {
  FormRegUsername(
      {super.key,
      // required this.RegUsername,
      required this.userNameController,
      required this.showUsername});

  bool showUsername;

  final TextEditingController userNameController;

  // String RegUsername;

  @override
  State<FormRegUsername> createState() => _FormRegUsernameState();
}

class _FormRegUsernameState extends State<FormRegUsername> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        maxLines: 1,
        controller: widget.userNameController,
        onChanged: (value) {
          if (value.isNotEmpty) {
            setState(() {
              widget.showUsername = true;
            });
          } else {
            setState(() {
              widget.showUsername = false;
            });
          }
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          labelText: 'Username',
          suffixIcon: widget.showUsername
              ? IconButton(
                  onPressed: () {
                    widget.userNameController.clear();
                    setState(() {
                      widget.showUsername = false;
                    });
                  },
                  icon: const Icon(Icons.clear),
                )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Username tidak boleh kosong';
          }
          if (value.length < 4) {
            return 'Username harus 4 karakter atau lebih';
          }
          return null;
        },
      ),
    );
  }
}
