import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weekly_task2/component/profile_component/content_profile.dart';
import 'package:weekly_task2/component/profile_component/header_profile.dart';
import 'package:weekly_task2/vvm/view_model.dart';
import 'home_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.color1, required this.color2, required this.color3});
  static const routeName = '/profilepage';

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences loginData;
  late bool isLogin;
  String user = 'no user';
  String email = 'no email';
  String password = 'no password';

  @override
  void initState() {
    dataUser();
    super.initState();
  }

  void dataUser() async {
    final prov = Provider.of<GameStoreManager>(context, listen: false);
    loginData = await SharedPreferences.getInstance();
    isLogin = loginData.getBool('isLogin') ?? true;
    if (isLogin == true) {
      setState(() {
        user = loginData.getString('username') ?? 'no user';
        email = loginData.getString('email') ?? 'no email';
        password = loginData.getString('password') ?? 'no password';
      });
    }
    print('email: $email');
    // if (email != 'no user') {
      prov.setDataUser(email, password);
      // items.add(ProfileInfoItem('Email', email));
      // items.add(ProfileInfoItem('Password', password));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameStoreManager>(
      builder: (context, value, _) =>
      value.apiState == ApiState.loading ?
        Scaffold(
          backgroundColor: widget.color1,
          body: const Center(child: CircularProgressIndicator()))
      : value.apiState == ApiState.error ?
        const Center(child: Text('Error load data..'))
      : value.apiState == ApiState.none ?
        Scaffold(
          backgroundColor: widget.color1,
          appBar: AppBar(
            backgroundColor: Colors.white70,
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: Column(
            children: [
              Flexible(
                flex: 2,
                child: HeaderProfile(color1: widget.color1, color2: widget.color2, color3: widget.color3)
              ),
              Flexible(
                flex: 3,
                child: Consumer<GameStoreManager>(
                  builder: (context, value, _) => ContentProfile(user: user, items: value.items))
              ),
            ],
          ),
        ) : const Center(child: Text('Please Check Your Connection Internet...'))
    );
  }
}
