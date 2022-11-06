import 'package:flutter/material.dart';

class AlertLogForm extends StatelessWidget {
  const AlertLogForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Container(
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
        padding: const EdgeInsets.all(20),
        child: const Text(
          'Error Login',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      contentPadding: const EdgeInsetsDirectional.only(top: 10, bottom: 0),
      content: SizedBox(
        height: 70,
        child: Column(
          children: [
            const Flexible(
                flex: 1,
                child: Text('Cek kembali')),
            Flexible(
              flex: 1,
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Username dan Password ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
            const Flexible(
                flex: 1,
                child: Text('Atau Register akun anda'))
          ],
        ),
      ),
      actionsPadding: const EdgeInsetsDirectional.only(
        top: 0, bottom: 10, start: 10, end: 10),
      actions: <Widget>[
        ElevatedButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'))
      ],
    );
  }
}