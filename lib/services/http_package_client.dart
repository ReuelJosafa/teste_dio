import 'dart:convert';

import 'http_client_interface.dart';
import 'package:http/http.dart' as http;

class HttpPackageClient implements HttpClientInterface {
  @override
  Future get(String url) async {
    final response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
