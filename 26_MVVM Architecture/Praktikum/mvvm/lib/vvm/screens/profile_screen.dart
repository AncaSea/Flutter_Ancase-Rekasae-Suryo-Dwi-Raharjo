import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      Provider.of<ViewModel>(context, listen: false).getAllProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: modelView.profile.length,
          itemBuilder: (context, index) {
            final data = modelView.profile[index];
            return ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Text('Name   : ${data.name}'),
                Text('Name   : ${data.gender}'),
                Text('Phone    : ${data.phone}'),
              ],
            );
          }),
    );
  }
}
