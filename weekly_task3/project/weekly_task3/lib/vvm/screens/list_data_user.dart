import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../actions/dialog_delete_user.dart';
import '../../form/form_contact_us.dart';
import '../../models/user_model.dart';
import '../view_model.dart';

class ListDataUser extends StatefulWidget {
  const ListDataUser({super.key});

  @override
  State<ListDataUser> createState() => _ListDataUserState();
}

class _ListDataUserState extends State<ListDataUser> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<BusManager>(context, listen: false);
    return Consumer<BusManager>(
      builder: (context, manager, child) {
      final dataUserItem = manager.dataUsers;
      return ListView.builder(
          itemCount: userProvider.dataUsers.length,
          itemBuilder: ((context, index) {
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
                    isThreeLine: true,
                    leading: CircleAvatar(
                        backgroundColor: Colors.grey[600],
                        child: const Icon(
                          Icons.message,
                          color: Colors.white,
                        )),
                    title: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.all(5),
                            child: Text(
                                '${userProvider.dataUsers[index].firstName} ${userProvider.dataUsers[index].lastName}')),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.all(5),
                            child: Text(
                              userProvider.dataUsers[index].message)),
                      ],
                    ),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          onPressed: () {
                            final dataUserUpdated = DataUser(
                              userProvider.dataUsers[index].id,
                              userProvider.dataUsers[index].firstName,
                              userProvider.dataUsers[index].lastName,
                              userProvider.dataUsers[index].email,
                              userProvider.dataUsers[index].message,);
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => FormContactUs(dataUser: dataUserUpdated),));
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => DialogDeleteUser(dataUserItem: dataUserItem, index: index)
                            );
                          },
                          icon: const Icon(Icons.delete_forever_rounded),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }));
      }
    );
  }
}