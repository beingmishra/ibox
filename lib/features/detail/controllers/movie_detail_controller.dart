import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ibox/features/detail/models/movie_credit_response_model.dart';
import 'package:ibox/features/detail/models/movie_detail_response_model.dart';
import 'package:ibox/features/detail/models/movie_recommendation_model.dart';
import 'package:ibox/network/api_service.dart';
import 'package:ibox/network/url_helper.dart';

class MovieDetailController extends GetxController {

  var apiService = ApiService();
  MovieDetailResponseModel? movieDetail;
  MovieCreditResponseModel? movieCredits;
  MovieRecommendationResponseModel? movieRecommendations;

  Future<void> fetchMovieDetail(int id) async {
    try{
      movieDetail = null;
      var response = await apiService.get(UrlHelper.movieDetails.replaceAll("{movie_id}", id.toString()), true);
      movieDetail = movieDetailResponseModelFromJson(response.body);
    }catch(e, stack){
      log(e.toString());
      debugPrintStack(stackTrace: stack);
    }
  }

  Future<void> fetchMovieCredits(int id) async {
    try{
      movieCredits = null;
      var response = await apiService.get(UrlHelper.movieCredits.replaceAll("{movie_id}", id.toString()), true);
      movieCredits = movieCreditResponseModelFromJson(response.body);
    }catch(e, stack){
      log(e.toString());
      debugPrintStack(stackTrace: stack);
    }
  }

  Future<void> fetchMovieRecommendations(int id) async {
    try{
      movieRecommendations = null;
      var response = await apiService.get(UrlHelper.movieRecommendations.replaceAll("{movie_id}", id.toString()), true);
      movieRecommendations = movieRecommendationResponseModelFromJson(response.body);
    }catch(e, stack){
      log(e.toString());
      debugPrintStack(stackTrace: stack);
    }
  }

}