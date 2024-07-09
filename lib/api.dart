import 'dart:convert';

import 'package:hng_stage_two/model/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl =
      'https://api.timbu.cloud/products?organization_id=ff6554e6f88d4410b276af390587d636&reverse_sort=false&page=1&size=10&Appid=LAE37QIE3OIAOUE&Apikey=79d1afdf3a7d425c958a81cf38ac6b6c20240708112908895887';

  Future<List<Product>> getProductList() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body)['items'];
      final List<Product> product =
          jsonData.map((data) => Product.fromJson(data)).toList();
          print(jsonData);
      print(product);
      return product;
    } else if (response.statusCode == 300) {
      throw Exception('Bad Request. The request was invalid.');
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else if (response.statusCode == 500) {
      throw Exception('Internal Server Error. An error occurred on the server');
    } else {
      throw Exception('Failed to load products');
    }
  }
}
