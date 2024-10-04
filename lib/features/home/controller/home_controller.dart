import 'package:get/get.dart';
import 'package:ibox/features/home/models/movie_response.dart';
import 'package:ibox/features/home/models/trending_media_response.dart';
import 'package:ibox/features/home/models/tv_response.dart';
import 'package:ibox/network/api_service.dart';
import 'package:ibox/network/url_helper.dart';

class HomeController extends GetxController {

  var apiService = ApiService();
  List<TrendingMediaItem> trendingMediaItems = [];
  List<MovieItem> movieNowPlayingItems = [];
  List<MovieItem> moviePopularItems = [];
  List<TvResponseItem> tvAiringTodayItems = [];
  List<TvResponseItem> tvPopularItems = [];

  Future<void> fetchTrendingMedia() async {
    var response = await apiService.get(UrlHelper.trendingMedia, true);
    var trendingMedia = trendingMediaResponseFromJson(response.body);
    trendingMediaItems.addAll(trendingMedia.results);
  }

  Future<void> fetchMovieNowPlaying() async {
    var response = await apiService.get(UrlHelper.movieNowPlaying, true);
    var movieRes = movieResponseFromJson(response.body);
    movieNowPlayingItems.addAll(movieRes.results);
  }

  Future<void> fetchMoviePopular() async {
    var response = await apiService.get(UrlHelper.moviePopular, true);
    var movieRes = movieResponseFromJson(response.body);
    moviePopularItems.addAll(movieRes.results);
  }

  Future<void> fetchTvAiringToday() async {
    var response = await apiService.get(UrlHelper.tvAiringToday, true);
    var tvRes = tvResponseFromJson(response.body);
    tvAiringTodayItems.addAll(tvRes.results);
  }

  Future<void> fetchTvPopular() async {
    var response = await apiService.get(UrlHelper.tvAiringToday, true);
    var tvRes = tvResponseFromJson(response.body);
    tvPopularItems.addAll(tvRes.results);
  }
}