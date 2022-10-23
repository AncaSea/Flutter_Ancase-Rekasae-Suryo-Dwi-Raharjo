import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task2/vvm/screens/empty_screen_user.dart';
import 'package:weekly_task2/vvm/screens/list_data_user.dart';
import 'package:weekly_task2/vvm/view_model.dart';
import '../../form/form_contact_us.dart';

class DataUserPage extends StatefulWidget {
  const DataUserPage({super.key});

  @override
  State<DataUserPage> createState() => _DataUserPageState();
}

class _DataUserPageState extends State<DataUserPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<BusManager>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Users'),
      ),
      body: userProvider.dataUsers.isNotEmpty
          ? const ListDataUser()
          : const EmptyScreenDataUser(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FormContactUs()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.grey,
        ),
      ),
    );
  }
}