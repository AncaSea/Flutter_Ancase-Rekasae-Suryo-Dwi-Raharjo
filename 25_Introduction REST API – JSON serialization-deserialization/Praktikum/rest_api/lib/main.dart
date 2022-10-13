import 'package:flutter/material.dart';
import 'package:rest_api/action/method.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  ActionMethodAPI method = ActionMethodAPI();
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Form(
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
                            child: Text('Job :'),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: jobController,
                              decoration: InputDecoration(
                                hintText: "Dokter",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Nomor tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () async {
                              final data = await method.getUsers(); 
                              setState(() {
                                method.listapi = data;
                              });
                            },
                            child: const Text(
                              "GET",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                final data = await method.postUser(name: nameController.text, job: jobController.text);
                                setState(() {
                                  method.listapi = data;
                                });
                              }
                            },
                            child: const Text(
                              "POST",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                final data = await method.putUser(name: nameController.text, job: jobController.text);
                                setState(() {
                                  method.listapi = data;
                                });
                              }
                            },
                            child: const Text(
                              "PUT",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await method.deleteUser();
                                setState(() {
                                  nameController.clear();
                                  jobController.clear();
                                  method.listapi.clear();
                                });
                              }
                            },
                            child: const Text(
                              "DELETE",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text('Result'),
                SizedBox(
                  child: Text('${method.listapi}'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
