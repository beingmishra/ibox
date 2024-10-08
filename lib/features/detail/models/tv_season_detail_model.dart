// To parse this JSON data, do
//
//     final tvSeasonDetailModel = tvSeasonDetailModelFromJson(jsonString);

import 'dart:convert';

TvSeasonDetailModel tvSeasonDetailModelFromJson(String str) => TvSeasonDetailModel.fromJson(json.decode(str));

String tvSeasonDetailModelToJson(TvSeasonDetailModel data) => json.encode(data.toJson());

class TvSeasonDetailModel {
  String id;
  DateTime airDate;
  List<Episode> episodes;
  String name;
  String overview;
  int tvSeasonDetailModelId;
  String? posterPath;
  int seasonNumber;
  double voteAverage;

  TvSeasonDetailModel({
    required this.id,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.tvSeasonDetailModelId,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  factory TvSeasonDetailModel.fromJson(Map<String, dynamic> json) => TvSeasonDetailModel(
    id: json["_id"],
    airDate: DateTime.parse(json["air_date"]),
    episodes: List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
    name: json["name"],
    overview: json["overview"],
    tvSeasonDetailModelId: json["id"],
    posterPath: json["poster_path"],
    seasonNumber: json["season_number"],
    voteAverage: json["vote_average"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "air_date": "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
    "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
    "name": name,
    "overview": overview,
    "id": tvSeasonDetailModelId,
    "poster_path": posterPath,
    "season_number": seasonNumber,
    "vote_average": voteAverage,
  };
}

class Episode {
  DateTime airDate;
  int episodeNumber;
  String episodeType;
  int id;
  String name;
  String overview;
  String productionCode;
  int? runtime;
  int seasonNumber;
  int showId;
  String? stillPath;
  double voteAverage;
  int voteCount;
  List<dynamic> crew;
  List<GuestStar> guestStars;

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
    airDate: DateTime.parse(json["air_date"]),
    episodeNumber: json["episode_number"],
    episodeType: json["episode_type"],
    id: json["id"],
    name: json["name"],
    overview: json["overview"],
    productionCode: json["production_code"],
    runtime: json["runtime"],
    seasonNumber: json["season_number"],
    showId: json["show_id"],
    stillPath: json["still_path"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
    crew: List<dynamic>.from(json["crew"].map((x) => x)),
    guestStars: List<GuestStar>.from(json["guest_stars"].map((x) => GuestStar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "air_date": "${airDate.year.toString().padLeft(4, '0')}-${airDate.month.toString().padLeft(2, '0')}-${airDate.day.toString().padLeft(2, '0')}",
    "episode_number": episodeNumber,
    "episode_type": episodeType,
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
    "guest_stars": List<dynamic>.from(guestStars.map((x) => x.toJson())),
  };
}

class GuestStar {
  String character;
  String creditId;
  int order;
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String? profilePath;

  GuestStar({
    required this.character,
    required this.creditId,
    required this.order,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
  });

  factory GuestStar.fromJson(Map<String, dynamic> json) => GuestStar(
    character: json["character"],
    creditId: json["credit_id"],
    order: json["order"],
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    knownForDepartment: json["known_for_department"],
    name: json["name"],
    originalName: json["original_name"],
    popularity: json["popularity"]?.toDouble(),
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "character": character,
    "credit_id": creditId,
    "order": order,
    "adult": adult,
    "gender": gender,
    "id": id,
    "known_for_department": knownForDepartment,
    "name": name,
    "original_name": originalName,
    "popularity": popularity,
    "profile_path": profilePath,
  };
}
