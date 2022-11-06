import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:weekly_task2/models/game_model.dart';
import 'package:weekly_task2/models/gamebycategory_model.dart';
import 'package:weekly_task2/models/gamedetail_model.dart';
import 'package:weekly_task2/service/api.dart';
import 'package:mockito/mockito.dart';

import 'api_test.mocks.dart';

const rapidApiKey = 'baa6b03797mshfc7334b2f7039b8p1815e8jsnfa4d834e86c8';
const rapidApiHost = 'free-to-play-games-database.p.rapidapi.com';
const successMessage = {'message': 'Success'};
const errorMessage = {'message': 'error'};
const testPath = '/games';
const testData = {'id': 5};
const header = {
  'X-RapidAPI-Key': rapidApiKey,
  'X-RapidAPI-Host': rapidApiHost
};

@GenerateMocks([ServiceAPI])
void main() {
  group('getGameData', () {
    ServiceAPI serviceGame = MockServiceAPI();

    test('returns All Game Data when http response is successful', () async {
      when(serviceGame.getAllGamesApi()).thenAnswer((realInvocation) async => <GameModel>[
        GameModel()
      ]);
      final gameData = await serviceGame.getAllGamesApi();
      expect(gameData.isNotEmpty, true);
    });

    test('returns Detail Game Data when http response is successful', () async {
      when(serviceGame.getDetailGamesApi(0)).thenAnswer((realInvocation) async => GameDetailModel(
          id: 5, title: 'title', thumbnail: 'thumbnail', status: 'status', shortDescription: 'shortDescription', 
          description: 'description', gameUrl: 'gameUrl', genre: 'genre', platform: 'platform', publisher: 'publisher', 
          developer: 'developer', releaseDate: 'releaseDate', freetogameProfileUrl: 'freetogameProfileUrl', 
          minimumSystemRequirements: MinimumSystemRequirements(os: 'os', processor: 'processor', memory: 'memory', graphics: 'graphics', storage: 'storage'), 
          screenshots: [Screenshots(id: 0, image: 'image')])
      );
      final gameData = await serviceGame.getDetailGamesApi(0);
      expect(gameData.description.isNotEmpty, true);
    });

    test('returns Game Data By Category when http response is successful', () async {
      when(serviceGame.getGameByCategory('shooter')).thenAnswer((realInvocation) async => <GameByCategoryModel>[
        GameByCategoryModel()
      ]);
      final gameData = await serviceGame.getGameByCategory('shooter');
      expect(gameData.isNotEmpty, true);
    });
  });
}