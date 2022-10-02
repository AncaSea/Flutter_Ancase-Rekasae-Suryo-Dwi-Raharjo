import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery/latihan_hal_baru.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main(List<String> args) {
  runApp(const LatihanDua());
}

class LatihanDua extends StatelessWidget {
  const LatihanDua({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const LatihanForm(),
        '/halBaru': (context) => const HalamanDua(),
      },
      // home: const LatihanForm(),
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
  final currentDate = DateTime.now();
  Color currentColor = Colors.amber;
  int valueColor = 0;
  PlatformFile file = PlatformFile(name: '', size: 0);
  File? display;

  TextEditingController tgllhr = TextEditingController();
  TextEditingController colorPick = TextEditingController();

  JenisKelamin? valueKelamin;
  String? jenisKelamin;

  TextEditingController nameController = TextEditingController();
  bool checkValueFlutter = false;
  bool checkValueReactJS = false;
  bool checkValueGolang = false;

  String valueDropdown = listClass.first;
  String fileName = '';
  
  Future pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    setState(() {
      if (result != null) {
        file = result.files.first;
        display = File(file.path.toString());
        fileName = file.path!.split('/').last;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan Form'),
      ),
      body: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
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
                  )),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 80,
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: const Text('Tanggal Lahir')),
                      Expanded(
                        child: TextFormField(
                          controller: tgllhr,
                          decoration: InputDecoration(
                            hintText: 'dd/MM/yyyy',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                          onTap: () async {
                            final selectDate = await showDatePicker(
                                context: context,
                                initialDate: currentDate,
                                firstDate: DateTime(1990),
                                lastDate: DateTime(currentDate.year + 5));
                            setState(() {
                              selectDate != null
                                  ? tgllhr.text =
                                    DateFormat('dd-MM-yyyy').format(selectDate)
                                  : null;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('Color Theme')),
                    Expanded(
                      child: TextFormField(
                        controller: colorPick,
                        decoration: InputDecoration(
                          hintText: "Pick a color",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                        onTap: () async {
                          // ignore: unused_local_variable
                          final selectColor = await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Pick Your Color'),
                              content: ListView(
                                children: [
                                  ColorPicker(
                                      pickerColor: currentColor,
                                      onColorChanged: (color) {
                                        setState(() {
                                          currentColor = color;
                                        });
                                      }),
                                ],
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('DONE'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    colorPick.text = currentColor
                                        .toString()
                                        .split('(0x')[1]
                                        .split(')')[0];
                                    valueColor = int.parse(colorPick.text, radix: 16);
                                  },
                                ),
                              ],
                            )
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Text('Cover'),
              ElevatedButton(
                onPressed: () async {
                  pickFile();
                },
                child: const Text(
                  "Pick File",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              file.name.isNotEmpty ?
                SizedBox(
                  child: Column(
                    children: [
                      Image.file(display!, fit: BoxFit.contain,),
                      Text(fileName)
                    ],
                  ),
                ) : 
                const SizedBox(
                  height: 10,
                ),
              Container(
                alignment: Alignment.center,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    if (
                    nameController.text.isEmpty
                    || jenisKelamin == null
                    || checkBoxValue().isEmpty
                    || valueDropdown.isEmpty
                    || tgllhr.text.isEmpty
                    || colorPick.text.isEmpty
                    || file.name.isEmpty
                    ) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Input Data'),
                              content: const Text('Mohon lengkapi data'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'))
                              ],
                            );
                          });
                    } else {
                      Navigator.pushNamed(
                        context,
                        '/halBaru',
                        arguments: (
                          DataOrang(
                            name: nameController.text,
                            kelamin: jenisKelamin,
                            program: checkBoxValue(),
                            kelas: valueDropdown,
                            tgl: tgllhr.text,
                            color: valueColor,
                            file: file
                          )
                        )
                      );
                      nameController.clear();
                      tgllhr.clear();
                      colorPick.clear();
                      setState(() {
                        valueKelamin = null;
                        checkValueFlutter = false;
                        valueDropdown = listClass.first;
                        file = PlatformFile(name: '', size: 0);
                      });
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )),
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