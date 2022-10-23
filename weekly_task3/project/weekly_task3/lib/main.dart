import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task2/section/contact_us_section.dart';
import 'package:weekly_task2/section/welcome_section.dart';
import 'package:weekly_task2/vvm/view_model.dart';

import 'models/drawer_model.dart';
import 'vvm/screens/about_us.dart';
import 'vvm/screens/contact_us.dart';
import 'vvm/screens/login.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => BusManager())
    ], 
    child: MyApp())
  );
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<DrawerItem> item = [
    DrawerItem('Contact Us', const ContactUs(), Icons.contact_support_outlined),
    DrawerItem('About Us', const AboutUs(), Icons.info_outline_rounded),
    DrawerItem('Login', const Login(), Icons.login_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 200,
                child: DrawerHeader(
                  decoration: const BoxDecoration(  
                    gradient: LinearGradient(colors: <Color>[  
                      Colors.lightBlue,  
                      Colors.blue  
                    ]),
                  ),
                  child: Column(
                    children: <Widget>[
                      Material(
                        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/favpng_bus-icon.png",
                              height: 90, width: 90),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Booking Bus Online',
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      )
                    ],
                  )
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: item.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: <Widget>[
                        Icon(item[index].icon),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            item[index].text,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => item[index].rute)
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/favpng_bus-icon.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.all(8.0), child: const Text('Booking Bus Online')
              ),
            ],
          ),
        ),
        body: ListView(
          children: const <Widget>[
            WelcomeSection(),
            ContactUsSection(),
          ],
        ),
      ),
    );
  }
}