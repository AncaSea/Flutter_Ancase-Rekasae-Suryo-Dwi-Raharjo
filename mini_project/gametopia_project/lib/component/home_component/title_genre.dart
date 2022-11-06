import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task2/vvm/view_model.dart';

class TitleGenreGame extends StatefulWidget {
  const TitleGenreGame({super.key, required this.genreList});

  final List<String> genreList;

  @override
  State<TitleGenreGame> createState() => _TitleGenreGameState();
}

class _TitleGenreGameState extends State<TitleGenreGame> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameStoreManager>(
      builder: (context, value, _) => 
      Container(
        padding: const EdgeInsets.only(
            bottom: 10, left: 22, right: 22),
        child:  ListView.builder(
          itemCount: widget.genreList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                splashColor: Colors.green,
                onTap: () {
                  // print('genre test');
                  value.getGameByCategory(widget.genreList[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(child: Text(widget.genreList[index])),
                ),
              ));
          },
        ),
      ),
    );
  }
}