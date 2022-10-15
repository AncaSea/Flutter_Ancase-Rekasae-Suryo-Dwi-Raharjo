import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      Provider.of<ViewModel>(context, listen: false).getAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: modelView.contacts.length,
          itemBuilder: (context, index) {
            final contact = modelView.contacts[index];
            return ListTile(
              title: Text('Name   : ${contact.name}'),
              subtitle: Text('Phone    : ${contact.phone}'),
            );
          }),
    );
  }
}
