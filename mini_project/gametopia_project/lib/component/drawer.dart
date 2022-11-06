import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/drawer_model.dart';

// ignore: must_be_immutable
class ListDrawer extends StatefulWidget {
  const ListDrawer({super.key});

  @override
  State<ListDrawer> createState() => _ListDrawerState();
}

class _ListDrawerState extends State<ListDrawer> {
  late SharedPreferences loginData;
  late bool isLogin;
  String user = 'no user';

  List<DrawerItem> item = [
    DrawerItem('Logout', '/loginpage', Icons.logout_rounded, true),
  ];

  @override
  void initState() {
    login();
    super.initState();
  }
  
  void sharedRemove(bool remove) async {
    if (remove == true) {
      final sharedLogOut = await SharedPreferences.getInstance();
      await sharedLogOut.setBool('remove', remove);
    }
  }

  void login() async {
    loginData = await SharedPreferences.getInstance();
    isLogin = loginData.getBool('isLogin') ?? true;
    if (isLogin == true) {
      setState(() {
        user = loginData.getString('username') ?? 'no user';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 200,
          child: DrawerHeader(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                gradient: LinearGradient(
                    colors: <Color>[Colors.lightBlue, Colors.blue]),
              ),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Material(
                    borderRadius:
                        BorderRadius.all(Radius.circular(50.0)),
                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        maxRadius: 35,
                        child: Icon(Icons.person, size: 50),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    user,
                    style: const TextStyle(color: Colors.white, fontSize: 25.0),
                  )
                ],
              )),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: item.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: <Widget>[
                  Icon(item[index].icon, color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      item[index].text,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                sharedRemove(item[index].remove);
                Navigator.pushReplacementNamed(
                  context, 
                  item[index].rute);
              },
            );
          },
        ),
      ],
    );
  }
}