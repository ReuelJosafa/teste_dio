import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_dio/src/modules/home/home_controller.dart';
import 'package:teste_dio/src/modules/home/models/product.dart';
import 'package:teste_dio/src/modules/home/services/home_service.dart';

class JsonPlaceholderServiceMock extends Mock implements HomeService {}

void main() {
  test('deve preencher lista de produtos', () async {
    final service = JsonPlaceholderServiceMock();
    when(() => service.fetchProducts())
        .thenAnswer((_) async => [Product(), Product()]);
    final controller = HomeController(service);
    await controller.fetchAllProducts();
    expect(controller.products.length, 2);
  });
}
