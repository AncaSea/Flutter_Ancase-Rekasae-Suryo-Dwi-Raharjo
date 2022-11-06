import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task2/component/home_component/list_genre.dart';
import 'package:weekly_task2/component/home_component/title_genre.dart';
import 'package:weekly_task2/vvm/view_model.dart';

import '../../main.dart';
import '../../vvm/screens/datadetail_screen.dart';

class ListHomeGenre extends StatefulWidget {
  const ListHomeGenre({super.key, required this.color1, required this.color2, required this.color3});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<ListHomeGenre> createState() => _ListGenreHomeState();
}

class _ListGenreHomeState extends State<ListHomeGenre> {

  List<String> genreList = [
    'Shooter', 'Strategy', 'MMORPG', 'Fighting',
    'Battle Royale', 'MOBA', 'Social', 'Sports', 'Card Game', 'MMO'
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<GameStoreManager>(
      builder: (context, value, child) => 
      Container(
        padding: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: widget.color3,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20))),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: TitleGenreGame(genreList: genreList)
            ),
            Flexible(
              flex: 8,
              child: ListGenreGame(color1: widget.color1, color2: widget.color2, color3: widget.color3)
            ),
          ],
        ),
      ),
    );
  }
}