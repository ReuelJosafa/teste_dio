import 'package:dio/dio.dart';

import 'data_source/http_client_interface.dart';

const baseUrl = 'https://teste-mercadinho-udemy.herokuapp.com/api/';

class DioRepository implements HttpClientInterface {
  final dio = Dio();

  @override
  Future get(String endPoint) async {
    final response = await dio.get('$baseUrl$endPoint');
    return response.data;
    /* if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'Ocorreu um erro no get do DioRepository! ${response.statusCode}');
    } */

    /* else if (response.statusCode == 404) {
      throw Exception('Página não encontrada!');
    } else if (response.statusCode == 500) {
      throw Exception('Erro de conexão com o servidor!');
    } */
  }

  @override
  Future post(String endPoint, dynamic data) async {
    final response = await dio.post('$baseUrl$endPoint', data: data);
    return response.data;
  }
}
