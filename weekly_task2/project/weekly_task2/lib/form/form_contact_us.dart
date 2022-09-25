import 'package:flutter/material.dart';
import 'package:weekly_task2/form/form_body.dart';

class FormContactUs extends StatefulWidget {
  const FormContactUs({super.key});

  @override
  State<FormContactUs> createState() => _FormContactUsState();
}

class _FormContactUsState extends State<FormContactUs> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () => Navigator.pop(context),
            splashRadius: 30,
          ),
          title: const Text('Form Contact Us'),
        ),
        body: GestureDetector(
          onTap: () {          
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: const FormBody()
        ),
      ),
    );
  }
}