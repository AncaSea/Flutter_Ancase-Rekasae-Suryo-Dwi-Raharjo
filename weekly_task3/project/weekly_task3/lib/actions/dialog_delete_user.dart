import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task2/models/user_model.dart';

import '../vvm/view_model.dart';

class DialogDeleteUser extends StatefulWidget {
  const DialogDeleteUser({super.key, required this.dataUserItem, required this.index});

  final List<DataUser> dataUserItem;
  final int index;

  @override
  State<DialogDeleteUser> createState() => _DialogDeleteUserState();
}

class _DialogDeleteUserState extends State<DialogDeleteUser> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<BusManager>(context, listen: false);
    return AlertDialog(
      content: const Text(
        'Are you sure to Delete?',
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
                      '${userProvider.dataUsers[widget.index].firstName} ${userProvider.dataUsers[widget.index].lastName} Deleted')),
            );
            userProvider.delete(widget.dataUserItem[widget.index].id);
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