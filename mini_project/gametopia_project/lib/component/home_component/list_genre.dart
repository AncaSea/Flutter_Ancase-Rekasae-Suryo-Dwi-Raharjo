import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../vvm/screens/datadetail_screen.dart';
import '../../vvm/view_model.dart';

class ListGenreGame extends StatefulWidget {
  const ListGenreGame({super.key, required this.color1, required this.color2, required this.color3});

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<ListGenreGame> createState() => _ListGenreGameState();
}

class _ListGenreGameState extends State<ListGenreGame> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GameStoreManager>(
      builder: (context, value, _) {
        return value.apiState == ApiState.loading ?
          const Center(child: CircularProgressIndicator())
        : value.apiState == ApiState.error ?
          const Text('Error load data..')
        : value.apiState == ApiState.none ?
        ListView.builder(
          itemCount: value.isCategory == false ? 
          value.listApiGames.length : 
          value.listApiGameByCategory.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Card(
              color: widget.color3,
              elevation: 3,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  splashColor: Colors.green,
                  onTap: () {
                    // print('test detail game');
                    Navigator.pushNamed(
                      context, 
                      DataDetailScreen.routeName,
                      arguments: DetailGameArgument(
                        value.isCategory == false ? 
                        value.listApiGames[index].id : value.listApiGameByCategory[index].id
                      ));
                  },
                  child: ListTile(
                    isThreeLine: true,
                    leading: Image.network(
                          value.isCategory == false ?
                          value.listApiGames[index].thumbnail! :
                          value.listApiGameByCategory[index].thumbnail!,
                          fit: BoxFit.cover),
                    title: Text(
                      value.isCategory == false ?
                          value.listApiGames[index].title! :
                          value.listApiGameByCategory[index].title!,
                      style: const TextStyle(color: Colors.white),),
                    subtitle: Text(
                      value.isCategory == false ?
                          value.listApiGames[index].publisher! :
                          value.listApiGameByCategory[index].publisher!,
                      style: const TextStyle(color: Colors.white54),),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // print('Download Game Test');
                        value.isCategory == false ?
                          value.launchURL(value.listApiGames[index].gameUrl!) :
                          value.launchURL(value.listApiGameByCategory[index].gameUrl!);
                      },
                      child: const Text(
                        "Download",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ) : 
        const Center(child: Text('Please Check Your Connection Internet...'));
      },
    );
  }
}