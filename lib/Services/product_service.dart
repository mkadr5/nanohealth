import 'dart:convert';

import 'package:nanohealth/Models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> getProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> getProduct(int id) async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products/$id'));
    if (response.statusCode == 200) {
      final dynamic productJson = jsonDecode(response.body);
      return Product.fromJson(productJson);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
