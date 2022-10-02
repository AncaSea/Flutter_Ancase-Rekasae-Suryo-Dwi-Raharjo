import 'package:contact/new_contact.dart';
import 'package:contact/new_contact2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Contact {
  String name;
  String phone;
  Contact({
    required this.name,
    required this.phone,
  });
}

class ContactNamedPush {
  String name;
  String phone;
  ContactNamedPush({
    required this.name,
    required this.phone,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Contacts(),
        '/halBaru': (context) => const NewContact2(),
      },
    );
  }
}

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  String nameNamedPush = '';
  String phoneNamedPush = '';
  String namePush = '';
  String phonePush = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: const Offset(0, 0),
              )
            ], borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Card(
              color: Colors.amber,
              child: SizedBox(
                width: 300,
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person),
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: const Text(' : ')),
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: Text(namePush)),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.phone),
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: const Text(' : ')),
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: Text(phonePush.toString())),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 0.5,
                blurRadius: 5,
                offset: const Offset(0, 0),
              )
            ], borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Card(
              color: Colors.amber,
              child: SizedBox(
                width: 300,
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.person),
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: const Text(' : ')),
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: Text(nameNamedPush)),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.phone),
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: const Text(' : ')),
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: Text(phoneNamedPush)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'btnPush',
            onPressed: () async {
              Contact dataPush = await Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => const NewContact()
                )
              );
              setState(() {
                namePush = dataPush.name;
                phonePush = dataPush.phone;
              });
            },
            child: const Text('Push'),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: 'btnNamedPush',
            onPressed: () async {
              ContactNamedPush dataNamedPush = await Navigator.pushNamed(context, '/halBaru') as ContactNamedPush;
              setState(() {
                nameNamedPush = dataNamedPush.name;
                phoneNamedPush = dataNamedPush.phone;
              });
            },
            child: const Text(
              'Named Push',
              textAlign: TextAlign.center
            ),
          ),
        ],
      ),
    );
  }
}
