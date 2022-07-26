import '../models/product.dart';
import '../../../services/data_source/http_client_interface.dart';

class HomeService {
  // final Dio _dio;
  final HttpClientInterface client;

  HomeService(this.client);

  Future<List<Product>> fetchProducts() async {
    final data = await client.get('produtos') as List;
    return data.map<Product>(Product.fromJson).toList();
  }

  Future<bool> insertProduct(Product product) async {
    return false;
  }

  /* Future<void> addProduct(Product product) async {
    final Response response = await _dio.post(url, data: product.toJson());
    print(response);
  } */
}
