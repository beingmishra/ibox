// To parse this JSON data, do
//
//     final personDetailResponseModel = personDetailResponseModelFromJson(jsonString);

import 'dart:convert';

PersonDetailResponseModel personDetailResponseModelFromJson(String str) => PersonDetailResponseModel.fromJson(json.decode(str));

String personDetailResponseModelToJson(PersonDetailResponseModel data) => json.encode(data.toJson());

class PersonDetailResponseModel {
  bool adult;
  List<String> alsoKnownAs;
  String biography;
  DateTime? birthday;
  DateTime? deathday;
  int gender;
  String? homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String? placeOfBirth;
  double popularity;
  String profilePath;
  Images images;
  MovieCredits movieCredits;
  TvCredits tvCredits;

  PersonDetailResponseModel({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.gender,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
    required this.images,
    required this.movieCredits,
    required this.tvCredits,
  });

  factory PersonDetailResponseModel.fromJson(Map<String, dynamic> json) => PersonDetailResponseModel(
    adult: json["adult"],
    alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
    biography: json["biography"],
    birthday: (json["birthday"] ?? "").isEmpty ? null : DateTime.parse(json["birthday"]),
    deathday: (json["deathday"] ?? "").isEmpty ? null : DateTime.parse(json["deathday"]),
    gender: json["gender"],
    homepage: json["homepage"],
    id: json["id"],
    imdbId: json["imdb_id"],
    knownForDepartment: json["known_for_department"],
    name: json["name"],
    placeOfBirth: json["place_of_birth"],
    popularity: json["popularity"]?.toDouble(),
    profilePath: json["profile_path"],
    images: Images.fromJson(json["images"]),
    movieCredits: MovieCredits.fromJson(json["movie_credits"]),
    tvCredits: TvCredits.fromJson(json["tv_credits"]),
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "also_known_as": List<dynamic>.from(alsoKnownAs.map((x) => x)),
    "biography": biography,
    "birthday": "${birthday?.year.toString().padLeft(4, '0')}-${birthday?.month.toString().padLeft(2, '0')}-${birthday?.day.toString().padLeft(2, '0')}",
    "deathday": deathday,
    "gender": gender,
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "known_for_department": knownForDepartment,
    "name": name,
    "place_of_birth": placeOfBirth,
    "popularity": popularity,
    "profile_path": profilePath,
    "images": images.toJson(),
    "movie_credits": movieCredits.toJson(),
    "tv_credits": tvCredits.toJson(),
  };
}

class Images {
  List<Profile> profiles;

  Images({
    required this.profiles,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    profiles: List<Profile>.from(json["profiles"].map((x) => Profile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "profiles": List<dynamic>.from(profiles.map((x) => x.toJson())),
  };
}

class Profile {
  double aspectRatio;
  int height;
  dynamic iso6391;
  String filePath;
  double voteAverage;
  int voteCount;
  int width;

  Profile({
    required this.aspectRatio,
    required this.height,
    required this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    aspectRatio: json["aspect_ratio"]?.toDouble(),
    height: json["height"],
    iso6391: json["iso_639_1"],
    filePath: json["file_path"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
    width: json["width"],
  );

  Map<String, dynamic> toJson() => {
    "aspect_ratio": aspectRatio,
    "height": height,
    "iso_639_1": iso6391,
    "file_path": filePath,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "width": width,
  };
}

class MovieCredits {
  List<MovieCreditsCast> cast;
  List<MovieCreditsCast> crew;

  MovieCredits({
    required this.cast,
    required this.crew,
  });

  factory MovieCredits.fromJson(Map<String, dynamic> json) => MovieCredits(
    cast: List<MovieCreditsCast>.from(json["cast"].map((x) => MovieCreditsCast.fromJson(x))),
    crew: List<MovieCreditsCast>.from(json["crew"].map((x) => MovieCreditsCast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
    "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
  };
}

class MovieCreditsCast {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;
  String? character;
  String creditId;
  int? order;
  String? department;
  String? job;

  MovieCreditsCast({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.character,
    required this.creditId,
    this.order,
    this.department,
    this.job,
  });

  factory MovieCreditsCast.fromJson(Map<String, dynamic> json) => MovieCreditsCast(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalLanguage: json["original_language"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    releaseDate: json["release_date"],
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
    character: json["character"],
    creditId: json["credit_id"],
    order: json["order"],
    department: json["department"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": releaseDate,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "character": character,
    "credit_id": creditId,
    "order": order,
    "department": department,
    "job": job,
  };
}

class TvCredits {
  List<TvCreditsCast> cast;
  List<TvCreditsCast> crew;

  TvCredits({
    required this.cast,
    required this.crew,
  });

  factory TvCredits.fromJson(Map<String, dynamic> json) => TvCredits(
    cast: List<TvCreditsCast>.from(json["cast"].map((x) => TvCreditsCast.fromJson(x))),
    crew: List<TvCreditsCast>.from(json["crew"].map((x) => TvCreditsCast.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
    "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
  };
}

class TvCreditsCast {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String? posterPath;
  String firstAirDate;
  String name;
  double voteAverage;
  int voteCount;
  String? character;
  String creditId;
  int episodeCount;
  String? department;
  String? job;

  TvCreditsCast({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
    this.character,
    required this.creditId,
    required this.episodeCount,
    this.department,
    this.job,
  });

  factory TvCreditsCast.fromJson(Map<String, dynamic> json) => TvCreditsCast(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originCountry: List<String>.from(json["origin_country"].map((x) => x)),
    originalLanguage: json["original_language"],
    originalName: json["original_name"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    firstAirDate: json["first_air_date"],
    name: json["name"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
    character: json["character"],
    creditId: json["credit_id"],
    episodeCount: json["episode_count"],
    department: json["department"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
    "original_language": originalLanguage,
    "original_name": originalName,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "first_air_date": firstAirDate,
    "name": name,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "character": character,
    "credit_id": creditId,
    "episode_count": episodeCount,
    "department": department,
    "job": job,
  };
}
