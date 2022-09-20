import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  List<ChatUsers> chatUsers = [
    ChatUsers(
        name: "Dio Brando",
        messageText: "Zehahahaha",
        imageURL: "assets/jojo.png",
        time: "Now",
        messages: '5',
        messageIn: true),
    ChatUsers(
        name: "Jotaro Kujo",
        messageText: "That's Great",
        imageURL: "assets/jotaro.jpg",
        time: "Yesterday",
        messages: '0',
        messageIn: false),
    ChatUsers(
        name: "Joseph Joestar",
        messageText: "Hey where are you?",
        imageURL: "assets/jojo.png",
        time: "31 Mar",
        messages: '6',
        messageIn: true),
    ChatUsers(
        name: "Giorno Giovanna",
        messageText: "Busy! Call me in 20 mins",
        imageURL: "assets/jotaro.jpg",
        time: "28 Mar",
        messages: '2',
        messageIn: true),
    ChatUsers(
        name: "Kira Yoshikage",
        messageText: "Thankyou, It's awesome",
        imageURL: "assets/jojo.png",
        time: "23 Mar",
        messages: '0',
        messageIn: false),
    ChatUsers(
        name: "Enrico Pucci",
        messageText: "will update you in evening",
        imageURL: "assets/jotaro.jpg",
        time: "17 Mar",
        messages: '0',
        messageIn: true),
    ChatUsers(
        name: "Adityo Joestar",
        messageText: "Can you please send the gun?",
        imageURL: "assets/jojo.png",
        time: "24 Feb",
        messages: '1',
        messageIn: true),
    ChatUsers(
        name: "Josuke Higashikata",
        messageText: "Nani?",
        imageURL: "assets/jotaro.jpg",
        time: "18 Feb",
        messages: '5',
        messageIn: true),
    ChatUsers(
        name: "Diavolo",
        messageText: "How are you?",
        imageURL: "assets/jojo.png",
        time: "18 Feb",
        messages: '0',
        messageIn: false),
    ChatUsers(
        name: "Mohammed Abdul",
        messageText: "Orarararara!!",
        imageURL: "assets/jotaro.jpg",
        time: "18 Feb",
        messages: '0',
        messageIn: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatUsers.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              ConversationList(
                name: chatUsers[index].name,
                messageText: chatUsers[index].messageText,
                imageUrl: chatUsers[index].imageURL,
                time: chatUsers[index].time,
                isMessageRead:
                    (chatUsers[index].messages == '0') ? true : false,
                messageIn: chatUsers[index].messageIn,
                messages: chatUsers[index].messages,
              ),
              const Divider(height: 25, thickness: 2)
            ],
          );
        },
      ),
    );
  }
}

class ChatUsers{
  String name;
  String messageText;
  String imageURL;
  String time;
  String messages;
  bool messageIn;
  ChatUsers({
        required this.name,
        required this.messageText,
        required this.imageURL,
        required this.time,
        required this.messages,
        required this.messageIn,
      });
}

// ignore: must_be_immutable
class ConversationList extends StatelessWidget {
  String name;
  String messageText;
  String imageUrl;
  String time;
  bool isMessageRead;
  bool messageIn;
  String messages;
  ConversationList(
      {super.key,
        required this.name,
        required this.messageText,
        required this.imageUrl,
        required this.time,
        required this.isMessageRead,
        required this.messageIn,
        required this.messages,
      });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(imageUrl),
                    backgroundColor: Colors.transparent,
                    maxRadius: 30,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: isMessageRead
                                    ? FontWeight.normal
                                    : FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: 
                        !isMessageRead && messageIn ? Colors.transparent
                        : isMessageRead && !messageIn ? Colors.blueGrey
                        : isMessageRead && messageIn ? Colors.green
                        : Colors.blueGrey
                        ),
                    Text(
                      time,
                      style: TextStyle(
                          fontSize:  isMessageRead 
                            ? 12
                            : 14,
                          fontWeight: isMessageRead
                            ? FontWeight.normal
                            : FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // borderRadius: BorderRadius.circular(10),
                    color: isMessageRead
                      ? Colors.white 
                      : Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7), //apply padding to all four sides
                    child: Text(
                      messages,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

