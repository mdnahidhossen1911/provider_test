abstract class BaseApiService {
  Future<dynamic> getRequest(String url);

  Future<dynamic> postRequest(String url,dynamic data);
}
