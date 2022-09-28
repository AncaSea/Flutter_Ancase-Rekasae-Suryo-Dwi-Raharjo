import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_value_form/preview_post.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Get Value',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Create Post'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  PlatformFile file = PlatformFile(name: '', size: 0);
  final currentDate = DateTime.now();
  Color currentColor = Colors.amber;

  TextEditingController published = TextEditingController();
  TextEditingController colorPick = TextEditingController();
  TextEditingController caption = TextEditingController();

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    file = result.files.first;
  }

  void openFile(PlatformFile file) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PreviewPost(
          file: file,
          published: published,
          colorPick: colorPick,
          caption: caption
      )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
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
              SizedBox(
                height: 80,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Publish At')
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: published,
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
                              ? published.text = DateFormat('dd-MM-yyyy').format(selectDate)
                              : null;
                          });
                        }, 
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Color Theme')
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: colorPick,
                        decoration: InputDecoration(
                          hintText: "Pick a color",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                          ),
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
                                    colorPick.text = currentColor.toString().split('(0x')[1].split(')')[0];
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
              SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: const Text('caption')    
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: caption,
                        maxLines: 7,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 100,
                child: ElevatedButton(
                  onPressed: () async {
                    openFile(file);
                  },
                  child: const Text(
                    "Simpan",
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
