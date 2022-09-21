import 'package:flutter/material.dart';

class Contact {
  String name;
  String profile;
  String number;
  Contact({
    required this.name,
    required this.profile,
    required this.number,
  });
}

// ignore: must_be_immutable
class ListViewWidget extends StatelessWidget {
  ListViewWidget({super.key});

  List<Contact> contact = [
    Contact(
        name: "Dio Brando",
        profile: "D",
        number: "12414-413 x831"),
    Contact(
        name: "Jotaro Kujo",
        profile: "J",
        number: "57275(1)"),
    Contact(
        name: "Joseph Joestar",
        profile: "J",
        number: "1341.451.542.1"),
    Contact(
        name: "Giorno Giovanna",
        profile: "G",
        number: "135135"),
    Contact(
        name: "Kira Yoshikage",
        profile: "K",
        number: "35246215"),
    Contact(
        name: "Enrico Pucci",
        profile: "E",
        number: "4652455 x431"),
    Contact(
        name: "Adityo Joestar",
        profile: "A",
        number: "344-63-52.435"),
    Contact(
        name: "Josuke Higashikata",
        profile: "J",
        number: "1241345"),
    Contact(
        name: "Diavolo",
        profile: "D",
        number: "3567752"),
    Contact(
        name: "Mohammed Abdul",
        profile: "M",
        number: "45246245"),
  ];
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView.builder(
        itemCount: contact.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 16),
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text(contact[index].name),
                  subtitle: Text(contact[index].number),
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent[700],
                    child: Text(
                      contact[index].profile,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: const Icon(Icons.star)),
              ),
              const Divider(thickness: 1)
            ],
          );
        },
      ),
    );
  }
}