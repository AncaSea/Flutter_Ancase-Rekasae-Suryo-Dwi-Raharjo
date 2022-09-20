import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class Codebar extends StatelessWidget {
  const Codebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarcodeWidget(
              padding: const EdgeInsets.all(10),
              barcode: Barcode.code128(),
              data: 'Altera Academy',
              width: 200,
              height: 200,
            ),
            const Divider(thickness: 2),
            Expanded(
              child: BarcodeWidget(
                padding: const EdgeInsets.all(10),
                barcode: Barcode.code128(),
                data: 'Flutter Pusing',
                width: 200,
                height: 150,
              ),
            ),
            const Divider(thickness: 2),
            Expanded(
              child: BarcodeWidget(
                padding: const EdgeInsets.all(10),
                barcode: Barcode.code128(),
                data: 'Ancase',
                width: 200,
                height: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
