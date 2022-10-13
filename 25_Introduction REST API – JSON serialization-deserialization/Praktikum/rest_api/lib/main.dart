import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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

class UserModel {
  String? name;
  String? job;

  UserModel(
    this.name,
    this.job,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'job': job,
    };
  }

  UserModel.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    job = map['job'];
  }
}

class UserModelGet {
  String? data;

  UserModelGet(
    this.data
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Dio dio = Dio();
  Map<String, dynamic> listapi = {};
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  Future getUsers() async {
    try {
      final Response response = await dio.get('https://reqres.in/api/users%27');
      debugPrint(response.data.toString());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future postUser({
    required String name,
    required String job,
  }) async {
    try {
      final Response response = await dio.post(
        'https://reqres.in/api/users',
        data: {
          'name': name,
          'job': job,
        },
      );
      final UserModel usermodel = UserModel.fromJson(response.data);
      debugPrint(response.data.toString());
      return usermodel.toMap();
    } catch (e) {
      rethrow;
    }
  }

  Future putUser({
    required String name,
    required String job,
  }) async {
    try {
      final Response response = await dio.put(
        'https://reqres.in/api/users/4',
        data: {
          'name': name,
          'job': job,
        },
      );
      final UserModel usermodel = UserModel.fromJson(response.data);
      debugPrint(response.data.toString());
      return usermodel.toMap();
    } catch (e) {
      rethrow;
    }
  }

  Future deleteUser() async {
    try {
      final Response response = await dio.delete(
        'https://reqres.in/api/users/4',
      );
      debugPrint(response.data.toString());
    } catch (e) {
      rethrow;
    }
  }

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
                              final data = await getUsers(); 
                              setState(() {
                                listapi = data;
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
                                final data = await postUser(name: nameController.text, job: jobController.text);
                                setState(() {
                                  listapi = data;
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
                                final data = await putUser(name: nameController.text, job: jobController.text);
                                setState(() {
                                  listapi = data;
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
                                await deleteUser();
                                setState(() {
                                  listapi.clear();
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
                  child: Text('$listapi'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
