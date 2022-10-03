import 'package:contact_setstate_provider/models/setstate_model.dart';
import 'package:contact_setstate_provider/set_state/new_contact.dart';
import 'package:flutter/material.dart';

class MyHomePageSetState extends StatefulWidget {
  const MyHomePageSetState({super.key});

  @override
  State<MyHomePageSetState> createState() => _MyHomePageSetStateState();
}

class _MyHomePageSetStateState extends State<MyHomePageSetState> {
  List<Contact> listContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts Set State'),
      ),
      body: listContacts.isNotEmpty
          ? ListView.builder(
              itemCount: listContacts.length,
              itemBuilder: ((context, index) {
                Contact contact = listContacts[index];
                return Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 0.5,
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                          )
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5))),
                    child: Card(
                      color: Colors.amber,
                      child: SizedBox(
                        width: 300,
                        height: 75,
                        child: ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.grey[600],
                              child: const Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              )),
                          title: Row(
                            children: [
                              const Icon(Icons.person),
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  child: const Text(' : ')),
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Text(contact.name)),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              const Icon(Icons.phone),
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  child: const Text(' : ')),
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Text(contact.phone)),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: const Text(
                                    'Are you sure?',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'NO',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  '${contact.name} Deleted')),
                                        );
                                        setState(() {
                                          listContacts.removeAt(index);
                                        });
                                      },
                                      child: const Text(
                                        'YES',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete_forever_rounded),
                          ),
                        ),
                      ),
                    ));
              }))
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(Icons.people_outline),
                  const Text('Your Contact is empty'),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () async {
          Contact dataPush = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewContact()));
          setState(() {
            listContacts
                .add(Contact(name: dataPush.name, phone: dataPush.phone));
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.grey,
        ),
      ),
    );
  }
}
