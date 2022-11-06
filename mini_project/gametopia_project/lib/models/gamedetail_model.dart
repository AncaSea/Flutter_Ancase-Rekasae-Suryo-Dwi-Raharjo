class GameDetailModel {
  GameDetailModel({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.status,
    required this.shortDescription,
    required this.description,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
    required this.minimumSystemRequirements,
    required this.screenshots,
  });
  late final int id;
  late final String title;
  late final String thumbnail;
  late final String status;
  late final String shortDescription;
  late final String description;
  late final String gameUrl;
  late final String genre;
  late final String platform;
  late final String publisher;
  late final String developer;
  late final String releaseDate;
  late final String freetogameProfileUrl;
  late final MinimumSystemRequirements minimumSystemRequirements;
  late final List<Screenshots> screenshots;

  GameDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    shortDescription = json['short_description'];
    description = json['description'];
    gameUrl = json['game_url'];
    genre = json['genre'];
    platform = json['platform'];
    publisher = json['publisher'];
    developer = json['developer'];
    releaseDate = json['release_date'];
    freetogameProfileUrl = json['freetogame_profile_url'];
    if (json['minimum_system_requirements'] != null) {
      minimumSystemRequirements = MinimumSystemRequirements
              .fromJson(json['minimum_system_requirements']);
    } else {
      minimumSystemRequirements = MinimumSystemRequirements(
        os: 'no information', processor: 'no information',
        memory: 'no information', graphics: 'no information', storage: 'no information');
    }
    if (json['screenshots'] != null) {
    screenshots = List.from(json['screenshots']).map((e) => Screenshots.fromJson(e))
        .toList();
    } else {
      screenshots = Screenshots(id: 0, image: 'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png?20210219185637') as List<Screenshots>;
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['thumbnail'] = thumbnail;
    _data['status'] = status;
    _data['short_description'] = shortDescription;
    _data['description'] = description;
    _data['game_url'] = gameUrl;
    _data['genre'] = genre;
    _data['platform'] = platform;
    _data['publisher'] = publisher;
    _data['developer'] = developer;
    _data['release_date'] = releaseDate;
    _data['freetogame_profile_url'] = freetogameProfileUrl;
    _data['minimum_system_requirements'] = minimumSystemRequirements.toJson();
    _data['screenshots'] = screenshots.map((e) => e.toJson()).toList();
    return _data;
  }
}

class MinimumSystemRequirements {
  MinimumSystemRequirements({
    required this.os,
    required this.processor,
    required this.memory,
    required this.graphics,
    required this.storage,
  });
  late final String os;
  late final String processor;
  late final String memory;
  late final String graphics;
  late final String storage;

  MinimumSystemRequirements.fromJson(Map<String, dynamic> json) {
    if (json['os'] != null) {
      os = json['os'];
      processor = json['processor'];
      memory = json['memory'];
      graphics = json['graphics'];
      storage = json['storage'];
    } else {
      os = 'no information';
      processor = 'no information';
      memory = 'no information';
      graphics = 'no information';
      storage = 'no information';
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['os'] = os;
    _data['processor'] = processor;
    _data['memory'] = memory;
    _data['graphics'] = graphics;
    _data['storage'] = storage;
    return _data;
  }
}

class Screenshots {
  Screenshots({
    required this.id,
    required this.image,
  });
  late final int id;
  late final String image;

  Screenshots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    return _data;
  }
}
