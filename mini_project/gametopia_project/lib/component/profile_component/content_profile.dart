import 'package:flutter/material.dart';

import '../../models/profile_model.dart';

class ContentProfile extends StatefulWidget {
  const ContentProfile({super.key, required this.user, required this.items});

  final String user;
  final List<ProfileInfoItem> items;

  @override
  State<ContentProfile> createState() => _ContentProfileState();
}

class _ContentProfileState extends State<ContentProfile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(widget.user, style: const TextStyle(fontSize: 30, 
                color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Container(
            height: 100,
            constraints: const BoxConstraints(maxWidth: 400),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: widget.items.map((item) => Expanded(
                child: Row(
                  children: [
                    if (widget.items.indexOf(item) != 0)
                      const VerticalDivider(color: Colors.white, thickness: 2),
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.white, fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(border: InputBorder.none,),
                            textAlign: TextAlign.center,
                            initialValue: item.value,
                            obscureText: widget.items.indexOf(item) != 0 ? true : false, readOnly: true,
                            style: const TextStyle(color: Colors.white54, fontSize: 20),) 
                        ),
                      ],
                    )),
                  ],
                )
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}