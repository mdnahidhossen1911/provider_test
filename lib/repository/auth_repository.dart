import 'package:provider_test/data/network/base_api_service.dart';
import 'package:provider_test/data/network/network_api_service.dart';
import 'package:provider_test/res/app_urls.dart';

class AuthRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = _apiService.postRequest(AppUrls.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = _apiService.postRequest(AppUrls.registerUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
