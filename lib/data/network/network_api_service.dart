import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:provider_test/data/app_exceptions.dart';
import 'package:provider_test/data/network/base_api_service.dart';

class NetworkApiService extends BaseApiService {

  //get
  @override
  Future getRequest(String url) async {
    dynamic responseJson;
    try {
      Response response = await get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


  // post
  @override
  Future postRequest(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url),body: data).timeout(Duration(seconds: 10));
      responseJson = returnJson(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }


  dynamic returnJson(Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorException(response.body.toString());
      default:
        throw FetchDataException(
          'Error accured while communication with serverwith status code: ${response.statusCode}',
        );
    }
  }
}
