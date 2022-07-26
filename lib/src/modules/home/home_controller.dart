import 'package:flutter/cupertino.dart';

import 'services/home_service.dart';
import 'models/product.dart';

class HomeController extends ChangeNotifier {
  final HomeService _service;

  HomeController(this._service);

  var products = <Product>[];

  Future<void> fetchAllProducts() async {
    products = [];
    products = await _service.fetchProducts();
    notifyListeners();
  }
}
