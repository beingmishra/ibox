import 'dart:developer';

import 'package:get/get.dart';
import 'package:ibox/features/people/model/person_detail_response.dart';
import 'package:ibox/network/api_service.dart';
import 'package:ibox/network/url_helper.dart';

class PeopleController extends GetxController {
  var apiService = ApiService();
  PersonDetailResponseModel? personDetail;

  Future<void> fetchPersonDetail(int id) async {
    try{
      personDetail = null;
      var response = await apiService.get(UrlHelper.personDetails.replaceAll("{person_id}", id.toString()), true);
      personDetail = personDetailResponseModelFromJson(response.body);
    }catch(e, stack){
      log(e.toString());
      print(stack);
    }
  }
}