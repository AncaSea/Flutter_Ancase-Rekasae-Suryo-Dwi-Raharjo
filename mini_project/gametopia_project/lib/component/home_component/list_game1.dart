import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../models/game_model.dart';
import '../../vvm/screens/datadetail_screen.dart';
import '../../vvm/view_model.dart';

class ListGame1Component extends StatefulWidget {
  const ListGame1Component({super.key, required this.color1, required this.color2, required this.color3, required this.listSearchGame});

  final List<GameModel> listSearchGame;
  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<ListGame1Component> createState() => _ListGame1ComponentState();
}

class _ListGame1ComponentState extends State<ListGame1Component> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 10, left: 10, right: 10, bottom: 5),
      decoration: BoxDecoration(
          color: widget.color2,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Consumer<GameStoreManager>(
        builder: (context, value, _) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: widget.listSearchGame.isNotEmpty ?
              widget.listSearchGame.length : value.listApiGames.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Card(
                elevation: 3,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(children: [
                        Image.network(widget.listSearchGame.isNotEmpty ?
                          widget.listSearchGame[index].thumbnail! : value.listApiGames[index].thumbnail!
                        ),
                        Positioned.fill(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              splashColor: Colors.green.withOpacity(0.5),
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                  context, DataDetailScreen.routeName,
                                  arguments: DetailGameArgument(widget.listSearchGame.isNotEmpty ?
                                    widget.listSearchGame[index].id : value.listApiGames[index].id));
                                // print('test detail game');
                              },
                            ),
                          ))
                      ])),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 5, sigmaY: 5),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0),
                          ),
                          child: Text(
                                widget.listSearchGame.isNotEmpty ?
                            widget.listSearchGame[index].title! :
                            value.listApiGames[index].title!,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white70),
                          ),),
                      ),
                    ),
                  ]
                )
              );
            },
          );
        },
      ),
    );
  }
}