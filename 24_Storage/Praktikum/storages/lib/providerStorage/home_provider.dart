import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storages/main.dart';
import 'package:storages/providerStorage/Models/register.dart';
import 'package:storages/providerStorage/provider.dart';
import 'package:storages/providerStorage/register_provider.dart';
import 'provider.dart' as register;

class RegisterProviderHome extends StatefulWidget {
  const RegisterProviderHome({super.key, required this.dataRegister});

  final Register dataRegister;

  @override
  State<RegisterProviderHome> createState() => _RegisterProviderHomeState();
}

class _RegisterProviderHomeState extends State<RegisterProviderHome> {

  void onRemove() {
    Provider.of<ListRegister>(context, listen: false).removeShared(widget.dataRegister);
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const MyApp(),
    ));
  }

  @override
  void initState() {
    Provider.of<register.ListRegister>(context, listen: false).initial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<register.ListRegister>(context);
    // registerProvider.initial();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            registerProvider.listregister.isNotEmpty ?
            Consumer<ListRegister>(
              builder: (BuildContext context, value, Widget? child) {
                return Text('Hello, ${value.listregister[0].nama}');
              },
            )
            :
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterProvider())
                );
              },
              child: const Text('Register')
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp())
                );
              },
              child: const Text('home')
            ),
            ElevatedButton(
              onPressed: () async {
                 onRemove();
              },
              child: const Text('Log Out')
            )
          ],
        ),
      ),
      
    );
  }
}