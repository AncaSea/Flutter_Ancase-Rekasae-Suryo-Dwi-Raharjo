import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const LatihanForm(),
    );
  }
}

class LatihanForm extends StatefulWidget {
  const LatihanForm({super.key});

  @override
  State<LatihanForm> createState() => _LatihanFormState();
}

enum JenisKelamin { lakiLaki, perempuan }

List<String> listClass = ['A', 'B', 'C'];

class _LatihanFormState extends State<LatihanForm> {
  final formKey = GlobalKey<FormState>();

  JenisKelamin? valueKelamin = JenisKelamin.lakiLaki;
  String? jenisKelamin;

  TextEditingController nameController = TextEditingController();
  bool checkValueFlutter = false;
  bool checkValueReactJS = false;
  bool checkValueGolang = false;

  String valueDropdown = listClass.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Form'),
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
                    child: Text('Nama :'),
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
              child: SizedBox(
                child: Row(
                  children: [
                    const Text('Jenis Kelamin :'),
                    Radio<JenisKelamin>(
                      value: JenisKelamin.lakiLaki,
                      groupValue: valueKelamin,
                      onChanged: (value) {
                        setState(() {
                          valueKelamin = value;
                          jenisKelamin = 'Laki-laki';
                        });
                      },
                    ),
                    const Text('Laki-laki'),
                    Radio<JenisKelamin>(
                      value: JenisKelamin.perempuan,
                      groupValue: valueKelamin,
                      onChanged: (value) {
                        setState(() {
                          valueKelamin = value;
                          jenisKelamin = 'Perempuan';
                        });
                      },
                    ),
                    const Text('Perempuan'),
                  ],
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Row(
                  children: [
                    const Text('Program :'),
                    Row(
                      children: [
                        Checkbox(
                          value: checkValueFlutter,
                          onChanged: (bool? value) {
                            setState(() {
                              checkValueFlutter = value ?? false;
                            });
                          },
                        ),
                      const Text('Flutter'),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checkValueReactJS,
                          onChanged: (bool? value) {
                            setState(() {
                              checkValueReactJS = value ?? false;
                            });
                          },
                        ),
                        const Text('ReactJS'),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checkValueGolang,
                          onChanged: (bool? value) {
                            setState(() {
                              checkValueGolang = value ?? false;
                            });
                          },
                        ),
                        const Text('GOlang'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Text(
                'Kelas :',
              ),
              title: DropdownButton<String>(
                value: valueDropdown,
                items: listClass
                    .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    valueDropdown = value!;
                  });
                },
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
                              Text('Name : ${nameController.text}'),
                              Text('Gender : $jenisKelamin'),
                              Text('Program : ${checkBoxValue()}'),
                              Text('Program : $valueDropdown')
                            ],
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
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
    );
  }

  String checkBoxValue() {
    String result = '';
    if (checkValueFlutter == true) {
      result += 'Flutter ';
    }
    if (checkValueGolang == true) {
      result += 'GOlang ';
    }
    if (checkValueReactJS == true) {
      result += 'ReactJS ';
    }
    return result;
  }
}
