import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
import 'cupertino_app/chat_page.dart';

void main() {
  runApp(const HomeChat());
}

class HomeChat extends StatelessWidget {
  const HomeChat({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoColors.white,
          border: const Border(
            bottom: BorderSide(color: CupertinoColors.white)),
          previousPageTitle: "Cupertino Chat UI",
          middle: const Text("Chats"),
          leading: Align(
            widthFactor: 1.0,
            alignment: Alignment.center,
            child: GestureDetector(
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: CupertinoColors.activeBlue,
                ),
              ),
              onTap: () {},
            ),
          ),
          trailing: GestureDetector(
            child: const Icon(CupertinoIcons.chat_bubble_2_fill),
            onTap: () {},
          ),
        ),
        child: SafeArea(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: CupertinoSearchTextField(
                  prefixInsets:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  suffixInsets: EdgeInsets.only(right: 20),
                ),
              ),
              const Expanded(
                child: CupertinoTabBottom(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CupertinoTabBottom extends StatelessWidget {
  const CupertinoTabBottom({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> data = [
      const Contacts(),
      const Calls(),
      const Chats(),
      const Settings()
    ];

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: CupertinoColors.activeBlue,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: "Contacts",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: "Calls",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2_fill),
            label: "Chats",
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "Settings",
          )
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return data[index];
          },
        );
      },
    );
  }
}
