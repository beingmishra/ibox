import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibox/features/search/models/search_movie_response_model.dart';
import 'package:ibox/features/search/models/search_person_response_model.dart';
import 'package:ibox/features/search/models/search_tv_response_model.dart';
import 'package:ibox/network/api_service.dart';
import 'package:ibox/network/url_helper.dart';

class SearchMediaController extends GetxController {

  var apiService = ApiService();
  SearchPersonResponseModel? searchPersonResponse;
  SearchMovieResponseModel? searchMovieResponse;
  SearchTvResponseModel? searchTvResponseModel;

  Future<void> searchPersons(String query) async {
    try{
      searchPersonResponse = null;
      var response = await apiService.get(UrlHelper.searchPerson + query, true);
      searchPersonResponse = searchPersonResponseModelFromJson(response.body);
    }catch(e, stack){
      log(e.toString());
      debugPrintStack(stackTrace: stack);
    }
  }

  Future<void> searchMovie(String query) async {
    try{
      searchMovieResponse = null;
      var response = await apiService.get(UrlHelper.searchMovie + query, true);
      searchMovieResponse = searchMovieResponseModelFromJson(response.body);
    }catch(e, stack){
      log(e.toString());
      debugPrintStack(stackTrace: stack);
    }
  }

  Future<void> searchTv(String query) async {
    try{
      searchTvResponseModel = null;
      var response = await apiService.get(UrlHelper.searchTv + query, true);
      searchTvResponseModel = searchTvResponseModelFromJson(response.body);
    }catch(e, stack){
      log(e.toString());
      debugPrintStack(stackTrace: stack);
    }
  }

}