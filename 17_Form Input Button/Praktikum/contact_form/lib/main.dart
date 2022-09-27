import 'package:contact_form/addContact/new_contact.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Contacts());
}

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: const ListContacts(),
    );
  }
}

class ListContacts extends StatefulWidget {
  const ListContacts({super.key});

  @override
  State<ListContacts> createState() => _ListContactsState();
}

class _ListContactsState extends State<ListContacts> {
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
                              child: const Text('Adit')),
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
                              child: const Text('08313513471')),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => NewContact())
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
