import 'package:dio/dio.dart';

import 'http_client_interface.dart';

class DioClient implements HttpClientInterface {
  final dio = Dio();

  @override
  Future get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
