import 'package:dio/native_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_dio/src/modules/home/services/home_service.dart';
import 'package:teste_dio/src/services/data_source/http_client_interface.dart';
import 'package:teste_dio/src/services/dio_repository.dart';
import 'package:teste_dio/src/services/http_repository.dart';


class DioMock extends Mock implements DioForNative {}

class HttpClientMock extends Mock implements HttpClientInterface {}

void main() async {
  test('Retorna todos os produtos', () async {
    // final dio = Dio();
    final client = DioRepository();
    // final client = DioClient();
    /* final respose = Response(
        requestOptions: RequestOptions(path: ''),
        data: jsonDecode(jsonProducts),
        statusCode: 200); */
    /* when(() => client.get(url))
        .thenAnswer((invocation) async => jsonDecode(jsonProducts)); */

    final homeService = HomeService(client);
    final products = await homeService.fetchProducts();
    expect(products[0].nome, 'Bolo de creme');
    print(products);
    // expect(products[1].nome, 'Bolo de creme');
  });
}

const jsonProducts =
    ''' 
    [
      {"id": 1, "nome": "Bolo de creme", "quantidade": 5, "valor": 1.5}, 
      {"id": 2, "nome": "bola", "quantidade": 2, "valor": 50.0}
    ]
''';
