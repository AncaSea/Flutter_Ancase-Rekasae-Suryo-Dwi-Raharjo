import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../vvm/view_model.dart';

class ThumbnailGameComponent extends StatefulWidget {
  const ThumbnailGameComponent({super.key, required this.color1, required this.color2, required this.color3});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<ThumbnailGameComponent> createState() => _ThumbnailGameComponentState();
}

class _ThumbnailGameComponentState extends State<ThumbnailGameComponent> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color2,
      elevation: 5,
      child: Container(
        height: MediaQuery.of(context).size.height * .30,
        padding: const EdgeInsets.all(15),
        width: MediaQuery.of(context).size.height * .45,
        child: Consumer<GameStoreManager>(
          builder: (context, value, _) {
            return Container(
              decoration: BoxDecoration(
                boxShadow: const [BoxShadow(
                  color: Colors.black,spreadRadius: 1.5,
                  blurRadius: 5,offset: Offset(0, 4),
                )],
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  value.apiDetailGame.thumbnail, 
                  fit: BoxFit.cover,
                  ),
              ),
            );
          },
        ),
      ),
    );
  }
}