class UrlHelper {

  static var imageUrl = "https://image.tmdb.org/t/p/w500/";

  static var trendingMedia = "trending/all/day";
  static var movieNowPlaying = "movie/now_playing";
  static var moviePopular = "movie/popular";
  static var movieUpcoming = "movie/upcoming";
  static var tvAiringToday = "tv/airing_today";
  static var tvPopular = "tv/popular";
  static var movieDetails = "movie/{movie_id}";
  static var movieCredits = "movie/{movie_id}/credits";
  static var movieRecommendations = "movie/{movie_id}/recommendations";
  static var tvDetails = "tv/{series_id}?append_to_response=credits,similar";
  static var tvSeasonDetails = "tv/{series_id}/season/{season_number}";
  static var personDetails = "person/{person_id}?append_to_response=images,movie_credits,tv_credits";
  static var searchMovie = "search/movie?query=";
  static var searchTv = "search/tv?query=";
  static var searchPerson = "search/person?query=";
}