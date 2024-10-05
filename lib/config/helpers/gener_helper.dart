import 'package:ibox/features/detail/models/movie_detail_response_model.dart';

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});
}

// List of movie genres
final List<Genre> movieGenres = [
  Genre(id: 28, name: "Action"),
  Genre(id: 12, name: "Adventure"),
  Genre(id: 16, name: "Animation"),
  Genre(id: 35, name: "Comedy"),
  Genre(id: 80, name: "Crime"),
  Genre(id: 99, name: "Documentary"),
  Genre(id: 18, name: "Drama"),
  Genre(id: 10751, name: "Family"),
  Genre(id: 14, name: "Fantasy"),
  Genre(id: 36, name: "History"),
  Genre(id: 27, name: "Horror"),
  Genre(id: 10402, name: "Music"),
  Genre(id: 9648, name: "Mystery"),
  Genre(id: 10749, name: "Romance"),
  Genre(id: 878, name: "Science Fiction"),
  Genre(id: 10770, name: "TV Movie"),
  Genre(id: 53, name: "Thriller"),
  Genre(id: 10752, name: "War"),
  Genre(id: 37, name: "Western"),
];

// List of TV genres
final List<Genre> tvGenres = [
  Genre(id: 10759, name: "Action & Adventure"),
  Genre(id: 16, name: "Animation"),
  Genre(id: 35, name: "Comedy"),
  Genre(id: 80, name: "Crime"),
  Genre(id: 99, name: "Documentary"),
  Genre(id: 18, name: "Drama"),
  Genre(id: 10751, name: "Family"),
  Genre(id: 10762, name: "Kids"),
  Genre(id: 9648, name: "Mystery"),
  Genre(id: 10763, name: "News"),
  Genre(id: 10764, name: "Reality"),
  Genre(id: 10765, name: "Sci-Fi & Fantasy"),
  Genre(id: 10766, name: "Soap"),
  Genre(id: 10767, name: "Talk"),
  Genre(id: 10768, name: "War & Politics"),
  Genre(id: 37, name: "Western"),
];

// Method to get genre name by id and media type
String getGenreById(int id, String mediaType) {
  List<Genre> selectedGenres;

  if (mediaType == "movie") {
    selectedGenres = movieGenres;
  } else if (mediaType == "tv") {
    selectedGenres = tvGenres;
  } else {
    return "Invalid media type";
  }

  // Find the genre by id
  Genre? genre = selectedGenres.firstWhere((genre) => genre.id == id, orElse: () => Genre(id: 0, name: "Unknown Genre"));
  return genre.name;
}

// Method to get a comma-separated genre string from a list of ids
String getGenresByIds(List<int> ids, String mediaType) {
  List<String> genreNames = ids.map((id) => getGenreById(id, mediaType)).toList();
  return genreNames.join(', ');
}

// Method to get a comma-separated genre string from a list of ids
String genreString(List<int> ids, String mediaType) {
  List<String> genreNames = ids.map((id) => getGenreById(id, mediaType)).toList();
  return genreNames.join(', ');
}

// Method to get a comma-separated genre string from a list of ids
String genreStringFromObj(List<GenreObj> ids) {
  List<String> genreNames = ids.map((id) => id.name).toList();
  return genreNames.join(', ');
}