import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
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

class ConversationList extends StatefulWidget {
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
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: ExactAssetImage(widget.imageUrl),
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
                            widget.name,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            widget.messageText,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                                fontWeight: widget.isMessageRead
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
            // Container(
              
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: 
                        !widget.isMessageRead && widget.messageIn ? Colors.transparent
                        : widget.isMessageRead && !widget.messageIn ? Colors.blueGrey
                        : widget.isMessageRead && widget.messageIn ? Colors.green
                        : Colors.blueGrey
                        ),
                    Text(
                      widget.time,
                      style: TextStyle(
                          fontSize:  widget.isMessageRead 
                            ? 12
                            : 14,
                          fontWeight: widget.isMessageRead
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
                    color: widget.isMessageRead
                      ? Colors.white 
                      : Colors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7), //apply padding to all four sides
                    child: Text(
                      widget.messages,
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

class _ChatPageState extends State<ChatPage> {

  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Dio Brando", messageText: "Zehahahaha", imageURL: "assets/jojo.png", time: "Now", messages: '5', messageIn: true),
    ChatUsers(name: "Jotaro Kujo", messageText: "That's Great", imageURL: "assets/jotaro.jpg", time: "Yesterday", messages: '0', messageIn: false),
    ChatUsers(name: "Joseph Joestar", messageText: "Hey where are you?", imageURL: "assets/jojo.png", time: "31 Mar", messages: '6', messageIn: true),
    ChatUsers(name: "Giorno Giovanna", messageText: "Busy! Call me in 20 mins", imageURL: "assets/jotaro.jpg", time: "28 Mar", messages: '2', messageIn: true),
    ChatUsers(name: "Kira Yoshikage", messageText: "Thankyou, It's awesome", imageURL: "assets/jojo.png", time: "23 Mar", messages: '0', messageIn: false),
    ChatUsers(name: "Enrico Pucci", messageText: "will update you in evening", imageURL: "assets/jotaro.jpg", time: "17 Mar", messages: '0', messageIn: true),
    ChatUsers(name: "Adityo Joestar", messageText: "Can you please send the gun?", imageURL:"assets/jojo.png", time: "24 Feb", messages: '1', messageIn: true),
    ChatUsers(name: "Josuke Higashikata", messageText: "Nani?", imageURL: "assets/jotaro.jpg", time: "18 Feb", messages: '5', messageIn: true),
    ChatUsers(name: "Diavolo", messageText: "How are you?", imageURL: "assets/jojo.png", time: "18 Feb", messages: '0', messageIn: false),
    ChatUsers(name: "Mohammed Abdul", messageText: "Orarararara!!", imageURL: "assets/jotaro.jpg", time: "18 Feb", messages: '0', messageIn: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: chatUsers.length,
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 16),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ConversationList(
              name: chatUsers[index].name,
              messageText: chatUsers[index].messageText,
              imageUrl: chatUsers[index].imageURL,
              time: chatUsers[index].time,
              isMessageRead: (chatUsers[index].messages == '0') ? true : false,
              messageIn: chatUsers[index].messageIn,
              messages: chatUsers[index].messages,
            );
          },
        ),
      ),
    );
  }
}