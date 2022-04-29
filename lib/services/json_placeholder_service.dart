import '../models/product.dart';
import 'http_client_interface.dart';

const url = 'https://teste-mercadinho-udemy.herokuapp.com/api/produtos';

class JsonPlaceholderService {
  // final Dio _dio;
  final HttpClientInterface client;

  JsonPlaceholderService(this.client);

  Future<List<Product>> getProducts() async {
    final data = await client.get(url) as List;

    return data.map<Product>(Product.fromJson).toList();
  }

  /* Future<void> addProduct(Product product) async {
    final Response response = await _dio.post(url, data: product.toJson());
    print(response);
  } */
}
