import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
              icon: Icons.group,
              text: 'New Group',
              onTap: () {}),
          _drawerItem(
              icon: Icons.lock,
              text: 'New Secret Chat',
              onTap: () {}),
          _drawerItem(
              icon: Icons.volume_up_sharp,
              text: 'New Channel',
              onTap: () {}),
          const Divider(height: 25, thickness: 1),
          // const Padding(
          //   padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
          //   child: Text("",
          //       style: TextStyle(
          //         fontSize: 16,
          //         color: Colors.black54,
          //       )),
          // ),
          _drawerItem(
              icon: Icons.contacts,
              text: 'Contact',
              onTap: () {}),
          _drawerItem(
              icon: Icons.add,
              text: 'Invite Friends',
              onTap: () => {}),
        _drawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () => {}),
        _drawerItem(
              icon: Icons.contact_support_rounded,
              text: 'Telegram FAQ',
              onTap: () => {}),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return const UserAccountsDrawerHeader(
    currentAccountPicture:  CircleAvatar(
      backgroundImage: ExactAssetImage("assets/hihihi.png"),
      backgroundColor: Colors.blueGrey,
      maxRadius: 30,
    ),
    decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
            image: AssetImage("assets/hitler-youth.jpg"), fit: BoxFit.cover)),
    accountName: Text(
        'Hala Madrid',
        style: TextStyle(
          color: Colors.white,
          backgroundColor: Colors.black,
        ),
      ),
    accountEmail: Text(
      'Merdeka@gmail.com',
      style: TextStyle(
        color: Colors.white,
        backgroundColor: Colors.black,
      ),
      ),
  );
}

Widget _drawerItem({IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
