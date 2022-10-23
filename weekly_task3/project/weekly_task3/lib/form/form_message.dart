import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FormMessage extends StatefulWidget {
  FormMessage({super.key, required this.showMessage, required this.message, required this.messageController});

  bool showMessage;
  final TextEditingController messageController;
  String message;

  @override
  State<FormMessage> createState() => _FormMessageState();
}

class _FormMessageState extends State<FormMessage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            child: const Text('What can we help you with?')),
        TextFormField(
          onChanged: (value) {
            value.isNotEmpty 
            ? setState(() {
                widget.showMessage = true;
              })
            : setState(() {
              widget.showMessage = false;
            });
          },
          controller: widget.messageController,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
          suffixIcon: widget.showMessage
          ? IconButton(
              onPressed: () {
                widget.messageController.clear();
                setState(() {
                  widget.showMessage = false;
                });
              }, 
              icon: const Icon(Icons.clear),
            )
          : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Message tidak boleh kosong';
            }
            return null;
          },
        ),
      ],
    );
  }
}