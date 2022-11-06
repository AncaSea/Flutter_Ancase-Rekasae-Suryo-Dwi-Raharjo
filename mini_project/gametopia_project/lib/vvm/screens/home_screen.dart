import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weekly_task2/component/home_component/genre_container.dart';
import 'package:weekly_task2/component/home_component/list_game1.dart';
import 'package:weekly_task2/vvm/screens/profile_screen.dart';
import '../../models/game_model.dart';
import '../../component/drawer.dart';
import '../view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.color1,
      required this.color2,
      required this.color3});
  static const routeName = '/homepage';

  final Color color1;
  final Color color2;
  final Color color3;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameModel> listSearchGame = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    Provider.of<GameStoreManager>(context, listen: false).getAllGames();               
    super.initState();
  }

  searchGame(String query) {
    final listGameProv = Provider.of<GameStoreManager>(context, listen: false).listApiGames;

    final suggestion = listGameProv.where((game) {
      final gameTitle = game.title!.toLowerCase();
      final input = query.toLowerCase();
      return gameTitle.contains(input);
    }).toList();

    setState(() {
      listSearchGame = suggestion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameStoreManager>(
      builder: (context, value, _) {
      return value.apiState == ApiState.loading ?
          // print('initState : ${gameProvider.apiState}')
          Scaffold(
            backgroundColor: widget.color1,
            body: const Center(child: CircularProgressIndicator()))
      : value.apiState == ApiState.error ?
        const Center(child: Text('Error load data..'))
      : value.apiState == ApiState.none ?
        // print('initState : ${gameProvider.apiState}')
        Scaffold(
          drawerScrimColor: widget.color3.withOpacity(0.7),
          backgroundColor: widget.color1,
          drawer: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  bottomRight: Radius.circular(400)),
            ),
            backgroundColor: widget.color2,
            child: const ListDrawer()),
          appBar: AppBar(
            backgroundColor: Colors.white70,
            title: const Text('GAMETOPIA'),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, ProfilePage.routeName);
                  },
                  icon: const Icon(Icons.person))
            ],
            centerTitle: true,
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          controller: searchController,
                          decoration: InputDecoration(
                            fillColor: Colors.blue[600],
                            filled: true,
                            prefixIcon: const Icon(Icons.search),
                            hintStyle: const TextStyle(color: Colors.white),
                            hintText: 'Search a Game!',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(width: 5)),
                          ),
                          onChanged: searchGame,
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        decoration: BoxDecoration(
                            color: widget.color2,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: const Text('List Game', style: TextStyle(color: Colors.white),
                        )),
                    Flexible(
                      flex: 5,
                      child: ListGame1Component(color1: widget.color1, color2: widget.color2, 
                        color3: widget.color3, listSearchGame: listSearchGame)
                    ),
                    Flexible(
                      flex: 14,
                      child: ListHomeGenre(color1: widget.color1, color2: widget.color2, color3: widget.color3)
                    )
                  ],
                ),
              ),
            ),
          ),
        ) : const Center(child: Text('Please Check Your Connection Internet...'));
    });
  }
}
