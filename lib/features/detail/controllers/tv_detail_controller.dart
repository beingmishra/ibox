import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ibox/features/detail/models/movie_credit_response_model.dart';
import 'package:ibox/features/detail/models/movie_detail_response_model.dart';
import 'package:ibox/features/detail/models/movie_recommendation_model.dart';
import 'package:ibox/features/detail/models/tv_credit_option_model.dart';
import 'package:ibox/features/detail/models/tv_detail_response_model.dart';
import 'package:ibox/features/detail/models/tv_similar_response_model.dart';
import 'package:ibox/network/api_service.dart';
import 'package:ibox/network/url_helper.dart';

class TvDetailController extends GetxController {

  var apiService = ApiService();
  TvDetailResponseModel? tvDetail;

  Future<void> fetchTvDetail(int id) async {
    try{
      tvDetail = null;
      var response = await apiService.get(UrlHelper.tvDetails.replaceAll("{series_id}", id.toString()), true);
      tvDetail = tvDetailResponseModelFromJson(response.body);
    }catch(e, stack){
      log(e.toString());
      debugPrintStack(stackTrace: stack);
    }
  }

}