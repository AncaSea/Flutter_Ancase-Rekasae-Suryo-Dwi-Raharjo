import 'package:flutter/cupertino.dart';
import 'chat_category.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: const Text(
          "Contacts page",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: const Text(
          "Calls page",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<Widget> screens = [
    const AllChats(),
    const Work(),
    const Unread(),
    const Personal()
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: false,
      tabBar:
      CupertinoTabBar(
        backgroundColor: CupertinoColors.white,
        border: const Border(
          top: BorderSide(
              color: CupertinoColors.white),
          bottom: BorderSide(
            color: CupertinoColors.quaternarySystemFill)
        ),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            // label: "Chats",
            icon: Text('All Chats'),
          ),
          const BottomNavigationBarItem(
            // label: "Calls",
            icon: Text('Work'),
          ),
          const BottomNavigationBarItem(
            // label: "People",
            icon: Text('Unread'),
          ),
          const BottomNavigationBarItem(
            // label: "Settings",
            icon: Text('Personal'),
          )
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return screens[index];
      },
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        child: const Text(
          "Settings page",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
