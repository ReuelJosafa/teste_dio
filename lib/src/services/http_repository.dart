import 'dart:convert';

import 'package:http/http.dart' as http;

import 'data_source/http_client_interface.dart';

class HttpRepository implements HttpClientInterface {
  @override
  Future get(String url) async {
    final response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }

  @override
  Future post(String url, dynamic data) async {
    final response = await http.post(Uri.parse(url), body: data);
    return jsonDecode(response.body);
  }
}
