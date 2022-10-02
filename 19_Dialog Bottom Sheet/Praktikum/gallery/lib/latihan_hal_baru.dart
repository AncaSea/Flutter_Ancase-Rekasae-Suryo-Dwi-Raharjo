import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DataOrang {
  String name;
  String? kelamin;
  String program;
  String kelas;
  String tgl;
  int color;
  PlatformFile file;
  DataOrang(
      {required this.name,
      required this.kelamin,
      required this.program,
      required this.kelas,
      required this.tgl,
      required this.color,
      required this.file});
}

class HalamanDua extends StatelessWidget {
  const HalamanDua({super.key});

  @override
  Widget build(BuildContext context) {
  final parameter = ModalRoute.of(context)?.settings.arguments as DataOrang;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Kedua'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                parameter.name,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          ClipRRect(
            child: Image.file(
              File(parameter.file.path!),
              fit: BoxFit.contain,
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
                      Text('Tanggal Lahir: ${parameter.tgl}'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  child: Row(
                    children: [
                      const Center(child: Text('Warna: ')),
                      CircleAvatar(
                        maxRadius: 8,
                        backgroundColor: Color(parameter.color),
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
              'Berjenis Kelamin : ${parameter.kelamin}',
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              ' Dari program : ${parameter.program}, Kelas : ${parameter.kelas} ',
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
