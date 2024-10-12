import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {

  // Base URL
  String baseUrl = 'https://api.themoviedb.org/3/';

  // HTTP client
  http.Client client = http.Client();

  // GET request
  Future<http.Response> get(String endpoint, bool isToken) async {
    var url = Uri.parse(baseUrl + endpoint);
    var response = await client.get(url, headers: getHeaders(isToken));
    print('Url is >>>>>>> $url');
    print('Response is >>>>>>> ${response.body}');
    return response;
  }

  // POST request
  Future<Response> post(String endpoint, bool isToken, {required Map<String, dynamic> body}) async {
    var url = Uri.parse(baseUrl + endpoint);
    print('Url is >>>>>>> $url');
    print('Request is >>>>>>> $body');
    var response = await client.post(url, headers: getHeaders(isToken), body: jsonEncode(body));
    return response;
  }

  // Custom URL GET request
  Future<Response> customGet(String urlStr, bool isToken) async {
    var url = Uri.parse(urlStr);
    var response = await client.get(url, headers: getHeaders(isToken));
    print('Url is >>>>>>> $url');
    return response;
  }

  // Auth header
  Map<String, String> getHeaders(bool isToken){
    if(isToken){
      return {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization' : 'Bearer ${const String.fromEnvironment('API_KEY', defaultValue: '')}'
      };
    }else{
      return {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };
    }
  }

  Future<Response> multipartPost(String endpoint, bool isToken, Map<String, String> fields, Iterable<http.MultipartFile> files
      ) async {
    var url = Uri.parse(baseUrl + endpoint);

    var request = http.MultipartRequest('POST', url);

    // Add headers
    request.headers.addAll(getHeaders(isToken));

    // Add fields
    request.fields.addAll(fields);
    log('Url is >>>>>>> $url');
    log('Request body is >>>>>>> $fields');

    // Add files
    request.files.addAll(files);

    var response = await client.send(request);
    var streamedResponse = await http.Response.fromStream(response);

    return streamedResponse;
  }

}