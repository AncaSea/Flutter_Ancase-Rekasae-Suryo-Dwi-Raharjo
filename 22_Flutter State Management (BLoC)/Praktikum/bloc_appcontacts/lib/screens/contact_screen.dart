import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact/contact_bloc.dart';
import '../models/contact_model.dart';
import '../new_contact.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key, required this.title});

  final String title;

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<ContactBloc>().add(InitializeContactEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ContactLoaded) {
            return state.itemContacts.isNotEmpty
                ? ListView.builder(
                    itemCount: state.itemContacts.length,
                    itemBuilder: ((context, index) {
                      Contact contact = state.itemContacts[index];
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
                                              context.read<ContactBloc>().add(
                                                  DeleteContact(state
                                                      .itemContacts[index]));
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
                                  icon:
                                      const Icon(Icons.delete_forever_rounded),
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
                  );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewContact()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.grey,
        ),
      ),
    );
  }
}
