import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

void main(List<String> args) {
  runApp(const LatihanLayouting());
}

class LatihanLayouting extends StatelessWidget {
  const LatihanLayouting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Latihan Layouting'),
        ),
        body: ListView(
          children: <Widget>[
            rowOne(),
            rowTwo(),
            rowThree()
          ],
        ),
      ),
    );
  }
}

class PropertyRowOne {
  IconData icon;
  PropertyRowOne(
    this.icon
  );
}

Widget rowOne() {
  List<PropertyRowOne> ikon = [
    PropertyRowOne(
      Icons.access_alarm
    ),
    PropertyRowOne(
      Icons.zoom_in_outlined
    ),
    PropertyRowOne(
      Icons.accessible_outlined
    ),
    PropertyRowOne(
      Icons.workspace_premium_sharp
    ),
  ];

  return SizedBox(
    height: 100,
    child: GridView.count(
      crossAxisCount: 4,
      children: List.generate(4, (index) {
        return Card(
          // color: Colors.deepPurpleAccent,
          margin: const EdgeInsets.all(15),
          child: Icon(ikon[index].icon, color: Colors.black, size: 30,),
        );
      }),
    ),
  );
}

Widget rowTwo() {
  return SizedBox(
    height: 180,
    child: ListView.builder(
      itemCount: 20,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Image.network(
                faker.image.image(
                  keywords: ['People'],
                  random: true,
                  height: 80,
                  width: 80,
                ),
              ),
              Text(faker.person.name()),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Click Here')
              )
          ]),
        );
      },
    ),
  );
}

Widget rowThree() {
  return SizedBox(
    height: 600,
    child: GridView.builder(
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.network(
                faker.image.image(
                  keywords: ['nature'],
                  random: true,
                ),
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: const Icon(Icons.heart_broken),
                ),
              ),
            ],
          ),
        );
      }
    ),
  );
}