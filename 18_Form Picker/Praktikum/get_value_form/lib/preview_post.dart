import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class PreviewPost extends StatefulWidget {
  const PreviewPost({super.key, required this.file, required this.published, required this.colorPick, required this.caption});

  final PlatformFile file;
  final TextEditingController published;
  final TextEditingController colorPick;
  final TextEditingController caption;

  @override
  State<PreviewPost> createState() => _PreviewPostState();
}

class _PreviewPostState extends State<PreviewPost> {

  String colorString = ''; 
  int value = 0;

  @override
  void initState() {
    colorString = widget.colorPick.text;
    value = int.parse(colorString, radix: 16);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Preview Post'),
        ),
        body: ListView(
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                child: Image.file(
                  File(widget.file.path!),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    child: Row(
                      children: [
                        const Text('Published: '),
                        Text(widget.published.text)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    child: Row(
                      children: [
                        const Center(child: Text('Color: ')),
                        CircleAvatar(
                          maxRadius: 8,
                          backgroundColor: Color(value),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.caption.text,
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
      ),
    );
  }
}