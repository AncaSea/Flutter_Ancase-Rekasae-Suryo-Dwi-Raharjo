import 'package:contact/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewContact2 extends StatefulWidget {
  const NewContact2({super.key});

  @override
  State<NewContact2> createState() => _NewContact2State();
}

class _NewContact2State extends State<NewContact2> {
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Contact Named Route'),
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
                      if (nameController.text.isNotEmpty ||
                          phoneController.text.isNotEmpty) {
                        Navigator.pop(
                          context,
                          ContactNamedPush(
                            name: nameController.text,
                            phone: phoneController.text
                          )
                        );
                      }
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return AlertDialog(
                      //       title: const Text('Input Data'),
                      //       content: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.stretch,
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           Text('Nama    : ${nameController.text}'),
                      //           const SizedBox(
                      //             height: 5,
                      //           ),
                      //           Text('Telepon : ${phoneController.text}'),
                      //           // Text('Message : $message')
                      //         ],
                      //       ),
                      //       actions: [
                      //         ElevatedButton(
                      //           onPressed: () => Navigator.pushNamed(
                      //             context,
                      //             '/',
                      //             arguments: (
                      //               Contact(
                      //                 name: nameController.text,
                      //                 phone: phoneController.text
                      //               )
                      //             )
                      //           ),
                      //           child: const Text('OK')
                      //         )
                      //       ],
                      //     );
                      //   }
                      // );
                    },
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
