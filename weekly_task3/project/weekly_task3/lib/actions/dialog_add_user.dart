import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:weekly_task2/form/form_body.dart';
import '../models/user_model.dart';
import '../vvm/screens/data_user.dart';
import '../vvm/view_model.dart';

class DialogAddUser extends StatefulWidget {
  const DialogAddUser({super.key, required this.firstName, required this.lastName, 
                      required this.email, required this.message, 
                      required this.firstNameController, required this.lastNameController, 
                      required this.emailController, required this.messageController});

  final TextEditingController firstNameController;
  final String firstName;
  final TextEditingController lastNameController;
  final String lastName;
  final TextEditingController emailController;
  final String email;
  final TextEditingController messageController;
  final String message;

  @override
  State<DialogAddUser> createState() => _DialogAddUserState();
}

class _DialogAddUserState extends State<DialogAddUser> {

  void clearText() {
    widget.firstNameController.clear();
    widget.lastNameController.clear();
    widget.emailController.clear();
    widget.messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final busProvider = Provider.of<BusManager>(context, listen: false);
    return AlertDialog(
        title: const Text('Input Data?'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Name : ${widget.firstName} ${widget.lastName}'),
            Text('Email : ${widget.email}'),
            Text('Message : ${widget.message}')
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              final dataUserAdd = DataUser(
                  const Uuid().v1(),
                  widget.firstNameController.text,
                  widget.lastNameController.text,
                  widget.emailController.text,
                  widget.messageController.text);
              busProvider.add(dataUserAdd);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DataUserPage(),
                  ));
            },
            child: const Text('OK')),
        ElevatedButton(
            onPressed: () {
              clearText();
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel'))
      ],
    );
  }
}