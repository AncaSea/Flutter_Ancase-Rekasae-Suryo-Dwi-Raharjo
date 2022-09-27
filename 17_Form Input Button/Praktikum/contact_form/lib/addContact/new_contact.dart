import 'package:contact_form/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class NewContact extends StatelessWidget {
  NewContact({super.key});

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create New Contact'),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text('Nama     :'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "contoh: Ancase",
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text('Telepon :'),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          hintText: "contoh: 0847513841653",
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
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Input Data'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Nama    : ${nameController.text}'),
                                const SizedBox(height: 5,),
                                Text('Telepon : ${phoneController.text}'),
                                // Text('Message : $message')
                              ],
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () =>
                                    Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const Contacts())
                                    ),
                                  child: const Text('OK'))
                            ],
                          );
                        });
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
} 