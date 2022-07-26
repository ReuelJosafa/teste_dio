abstract class HttpClientInterface {
  Future<dynamic> get(String endPoint);

  Future<dynamic> post(String endPoint, dynamic data);
}
