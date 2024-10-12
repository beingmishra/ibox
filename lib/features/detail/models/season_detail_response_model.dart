// To parse this JSON data, do
//
//     final seasonDetailResponseModel = seasonDetailResponseModelFromJson(jsonString);

import 'dart:convert';

SeasonDetailResponseModel seasonDetailResponseModelFromJson(String str) => SeasonDetailResponseModel.fromJson(json.decode(str));

String seasonDetailResponseModelToJson(SeasonDetailResponseModel data) => json.encode(data.toJson());

class SeasonDetailResponseModel {
  String id;
  DateTime? airDate;
  List<Episode> episodes;
  String name;
  String overview;
  int seasonDetailResponseModelId;
  dynamic posterPath;
  int seasonNumber;
  double voteAverage;

  SeasonDetailResponseModel({
    required this.id,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.seasonDetailResponseModelId,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory SeasonDetailResponseModel.fromJson(Map<String, dynamic> json) => SeasonDetailResponseModel(
    id: json["_id"],
    airDate: (json["air_date"] ?? "").isEmpty ? null : DateTime.parse(json["air_date"]),
    episodes: List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
    name: json["name"],
    overview: json["overview"],
    seasonDetailResponseModelId: json["id"],
    posterPath: json["poster_path"],
    seasonNumber: json["season_number"],
    voteAverage: json["vote_average"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "air_date": "${airDate?.year.toString().padLeft(4, '0')}-${airDate?.month.toString().padLeft(2, '0')}-${airDate?.day.toString().padLeft(2, '0')}",
    "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
    "name": name,
    "overview": overview,
    "id": seasonDetailResponseModelId,
    "poster_path": posterPath,
    "season_number": seasonNumber,
    "vote_average": voteAverage,
  };
}

class Episode {
  DateTime? airDate;
  int episodeNumber;
  EpisodeType? episodeType;
  int id;
  String name;
  String overview;
  String productionCode;
  dynamic runtime;
  int seasonNumber;
  int showId;
  dynamic stillPath;
  double voteAverage;
  int voteCount;
  List<dynamic> crew;
  List<dynamic> guestStars;

  Episode({
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
    required this.crew,
    required this.guestStars,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    airDate: (json["air_date"] ?? "").isEmpty ? null : DateTime.parse(json["air_date"]),
    episodeNumber: json["episode_number"],
    episodeType: episodeTypeValues.map[json["episode_type"]],
    id: json["id"],
    name: json["name"],
    overview: json["overview"],
    productionCode: json["production_code"],
    runtime: json["runtime"],
    seasonNumber: json["season_number"],
    showId: json["show_id"],
    stillPath: json["still_path"],
    voteAverage: json["vote_average"],
    voteCount: json["vote_count"],
    crew: List<dynamic>.from(json["crew"].map((x) => x)),
    guestStars: List<dynamic>.from(json["guest_stars"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "air_date": "${airDate?.year.toString().padLeft(4, '0')}-${airDate?.month.toString().padLeft(2, '0')}-${airDate?.day.toString().padLeft(2, '0')}",
    "episode_number": episodeNumber,
    "episode_type": episodeTypeValues.reverse[episodeType],
    "id": id,
    "name": name,
    "overview": overview,
    "production_code": productionCode,
    "runtime": runtime,
    "season_number": seasonNumber,
    "show_id": showId,
    "still_path": stillPath,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "crew": List<dynamic>.from(crew.map((x) => x)),
    "guest_stars": List<dynamic>.from(guestStars.map((x) => x)),
  };
}

enum EpisodeType {
  STANDARD
}

final episodeTypeValues = EnumValues({
  "standard": EpisodeType.STANDARD
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
