import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../vvm/screens/data_user.dart';
import '../vvm/view_model.dart';

class DialogUpdateUser extends StatefulWidget {
  const DialogUpdateUser({super.key, required this.firstNameController, 
                        required this.firstName, required this.lastNameController, 
                        required this.lastName, required this.emailController, 
                        required this.email, required this.messageController, 
                        required this.message, this.dataUserModel});

  final DataUser? dataUserModel;
  final TextEditingController firstNameController;
  final String firstName;
  final TextEditingController lastNameController;
  final String lastName;
  final TextEditingController emailController;
  final String email;
  final TextEditingController messageController;
  final String message;

  @override
  State<DialogUpdateUser> createState() => _DialogUpdateUserState();
}

class _DialogUpdateUserState extends State<DialogUpdateUser> {
  @override
  Widget build(BuildContext context) {
  final busProvider = Provider.of<BusManager>(context, listen: false);
    return AlertDialog(
      title: const Text(
        'Are you sure to Edit?',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
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
            final dataUserUpdated = DataUser(
                widget.dataUserModel!.id,
                widget.firstNameController.text,
                widget.lastNameController.text,
                widget.emailController.text,
                widget.messageController.text);
            busProvider.update(dataUserUpdated);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DataUserPage(),)
            );
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
    );
  }
}