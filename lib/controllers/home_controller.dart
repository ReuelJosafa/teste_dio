import 'package:flutter/cupertino.dart';

import '../models/product.dart';
import '../services/json_placeholder_service.dart';

class HomeController extends ChangeNotifier {
  final JsonPlaceholderService _service;

  HomeController(this._service);

  var products = <Product>[];

  Future<void> fetchAllProducts() async {
    products = [];
    products = await _service.getProducts();
    notifyListeners();
  }
}
