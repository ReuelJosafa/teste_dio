import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_dio/controllers/home_controller.dart';
import 'package:teste_dio/models/product.dart';
import 'package:teste_dio/services/json_placeholder_service.dart';

class JsonPlaceholderServiceMock extends Mock
    implements JsonPlaceholderService {}

void main() {
  test('deve preencher lista de produtos', () async {
    final service = JsonPlaceholderServiceMock();
    when(() => service.getProducts()).thenAnswer((_) async => [Product(),Product() ]);
    final controller = HomeController(service);
    await controller.fetchAllProducts();
    expect(controller.products.length, 2);
  });
}
