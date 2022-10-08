import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool onAnima = false;

  bool onTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Klik Gambar di Bawah ini'),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Stack(
                children: [
                  Ink(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(faker.image.image()),
                            fit: BoxFit.cover)),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            onAnima = !onAnima;
                          });
                        },
                        child: AnimatedContainer(
                          height: onAnima ? 200 : 100,
                          width: onAnima ? 200 : 100,
                          duration: const Duration(milliseconds: 300),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}