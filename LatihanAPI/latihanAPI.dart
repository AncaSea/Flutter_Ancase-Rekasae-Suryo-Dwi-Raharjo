class Data {
  String? id;
  String? type;
  Links? links;
  Attributes? attributes;

  Data(
    this.id,
    this.type,
    this.links,
    this.attributes,
  );
}

class Links {
  String? self;
  
  Links(
    this.self
  );

  Map<String, dynamic> toJson() => {
    'self': self,
  };
}

class Attributes {
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? synopsis;
  String? description;
  String? coverImageTopOffset;
  Title? title;
  String? canonicalTitle;
  List? abbreviatedTitles;
  String? averageRating;
  RatingFrequencies? ratingFrequenciesl;
  int? userCount;
  int? favoritesCount;
  String? startDate;
  String? endDate;
  String? nextRelease;
  String? popularityRank;
  String? ratingRank;
  String? ageRating;
  String? ageRatingGuide;
  String? subtype;
  String? status;
  String? tba;
  PosterImage? posterImage;
  String? coverImage;
  String? chapterCount;
  int? volumeCount;
  String? serialization;
  String? mangaType;

  Attributes(
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.synopsis,
    this.description,
    this.coverImageTopOffset,
    this.title,
    this.canonicalTitle,
    this.abbreviatedTitles,
    this.averageRating,
    this.ratingFrequenciesl,
    this.userCount,
    this.favoritesCount,
    this.startDate,
    this.endDate,
    this.nextRelease,
    this.popularityRank,
    this.ratingRank,
    this.ageRating,
    this.ageRatingGuide,
    this.subtype,
    this.status,
    this.tba,
    this.posterImage,
    this.coverImage,
    this.chapterCount,
    this.volumeCount,
    this.serialization,
    this.mangaType,
  );
}

class Title {
  String? en;
  String? en_jp;
  String? en_us;
  String? ja_jp;

  Title(
    this.en,
    this.en_jp,
    this.en_us,
    this.ja_jp,
  );
}

class RatingFrequencies {
  String? two;
  String? three;
  String? four;
  String? five;
  String? six;
  String? seven;
  String? eight;
  String? nine;
  String? ten;
  String? eleven;
  String? twelve;
  String? thirdten;
  String? fourten;
  String? fiveten;
  String? sixten;
  String? seventen;
  String? eighten;
  String? nineten;
  String? twenty;

  RatingFrequencies(
    this.two,
    this.three,
    this.four,
    this.five,
    this.six,
    this.seven,
    this.eight,
    this.nine,
    this.ten,
    this.eleven,
    this.twelve,
    this.thirdten,
    this.fourten,
    this.fiveten,
    this.sixten,
    this.seventen,
    this.eighten,
    this.nineten,
    this.twenty,
  );
}

class PosterImage {
  String? tiny;
  String? large;
  String? small;
  String? medium;
  String? original;

  PosterImage(
    this.tiny,
    this.large,
    this.small,
    this.medium,
    this.original,
  );
}

