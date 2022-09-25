import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormName extends StatefulWidget {
  FormName({super.key,  required this.firstName,  required this.lastName,
    required this.firstNameController, required this.lastNameController, 
    required this.showFirstName, required this.showLastName});

  bool showFirstName;
  bool showLastName;

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  String firstName;
  String lastName;

  @override
  State<FormName> createState() => _FormNameState();
}

class _FormNameState extends State<FormName> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10
        ),
        children: [
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text('First Name*')
              ),
              TextFormField(
                controller: widget.firstNameController,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      widget.showFirstName= true;
                    });
                  } else {
                    setState(() {
                      widget.showFirstName = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: "contoh: Susilo",
                  suffixIcon: widget.showFirstName
                  ? IconButton(
                      onPressed: () {
                        widget.firstNameController.clear();
                        setState(() {
                          widget.showFirstName = false;
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
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text('Last Name*')
              ),
              TextFormField(
                controller: widget.lastNameController,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      widget.showLastName = true;
                    });
                  } else {
                    setState(() {
                      widget.showLastName = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  hintText: "contoh: Bambang",
                  suffixIcon: widget.showLastName
                  ? IconButton(
                      onPressed: () {
                        widget.lastNameController.clear();
                        setState(() {
                          widget.showLastName = false;
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
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}