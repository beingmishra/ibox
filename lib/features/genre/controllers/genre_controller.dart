import 'dart:developer';

import 'package:get/get.dart';
import 'package:ibox/features/genre/models/genre_movie_response_model.dart';
import 'package:ibox/features/genre/models/genre_tv_response_model.dart';
import 'package:ibox/network/api_service.dart';
import 'package:ibox/network/url_helper.dart';

class GenreController extends GetxController {
  var apiService = ApiService();
  GenreMovieResponseModel? genreMovies;
  GenreTvResponseModel? genreTvShows;

  Future<void> fetchGenreMovies(int page, int genre) async {
    try{
      var response = await apiService.get(UrlHelper.discoverMovies.replaceAll("{page_num}", page.toString()).replaceAll("{genre_id}", genre.toString()), true);
      genreMovies = genreMovieResponseModelFromJson(response.body);
    }catch(e, stack){
      log(e.toString());
      print(stack);
    }
  }

  Future<void> fetchGenreTv(int page, int genre) async {
    try{
      var response = await apiService.get(UrlHelper.discoverTvShows.replaceAll("{page_num}", page.toString()).replaceAll("{genre_id}", genre.toString()), true);
      genreTvShows = genreTvResponseModelFromJson(response.body);
    }catch(e, stack){
      log(e.toString());
      print(stack);
    }
  }

}