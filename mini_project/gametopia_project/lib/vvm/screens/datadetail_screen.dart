import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task2/component/datadetail_component/bottom_content.dart';
import 'package:weekly_task2/component/datadetail_component/content_game.dart';
import 'package:weekly_task2/component/datadetail_component/thumbnail_game.dart';
import 'package:weekly_task2/vvm/screens/profile_screen.dart';
import '../view_model.dart';
import 'home_screen.dart';

class DataDetailScreen extends StatefulWidget {
  const DataDetailScreen({super.key, required this.id, required this.color1, required this.color2, required this.color3});
  static const routeName = '/datadetailpage';

  final Color color1;
  final Color color2;
  final Color color3;
  final int? id;

  @override
  State<DataDetailScreen> createState() => _DataDetailScreenState();
}

class _DataDetailScreenState extends State<DataDetailScreen> {

  List<String> listMinReq = [
    'os', 'processor', 'memory', 'graphics', 'storage'
  ];

  @override
  void initState() {
    Provider.of<GameStoreManager>(context, listen: false)
    .getDetailGame(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameStoreManager>(
      builder: (context, value, _) {
      return value.apiState == ApiState.loading ?
          Scaffold(
            backgroundColor: widget.color1,
            body: const Center(child: CircularProgressIndicator()))
          // print('initState : ${gameProvider.apiState}')
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
                Navigator.pushReplacementNamed(context, HomePage.routeName);},
              icon: const Icon( Icons.arrow_back, color: Colors.black,),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, ProfilePage.routeName);
                  },
                  icon: const Icon(Icons.person, color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                ThumbnailGameComponent(color1: widget.color1, color2: widget.color2, color3: widget.color3),
                Expanded(
                  child: ContentGame(color1: widget.color1, color2: widget.color2, color3: widget.color3, listMinReq: listMinReq)
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomContent(color1: widget.color1, color2: widget.color2, color3: widget.color3)
        ) : const Center(child: Text('Please Check Your Connection Internet...'));
    });
  }
}
