import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibox/features/search/models/search_person_response_model.dart';
import 'package:ibox/network/api_service.dart';
import 'package:ibox/network/url_helper.dart';

class SearchController extends GetxController {
  var apiService = ApiService();
  SearchPersonResponseModel? searchPersonResponse;


  Future<void> searchPersons(String query) async {
    try{
      searchPersonResponse = null;
      var response = await apiService.get(UrlHelper.movieDetails.replaceAll("{movie_id}", id.toString()), true);
      searchPersonResponse = searchPersonResponseModelFromJson(response.body);
    }catch(e, stack){
      log(e.toString());
      debugPrintStack(stackTrace: stack);
    }
  }

}