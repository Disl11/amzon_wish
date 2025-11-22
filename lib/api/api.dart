import 'package:amazonwish/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsRepo {
  static Future<List<Product>> getProducts() async {
    try {
      final res = await http.get(Uri.parse('http://dummyjson.com/products'));
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final List productJson = data['products'];
        return productJson.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception("erreur serveur product");
      }
    } catch (e) {
      throw Exception("erreur serveur ${e}");
    }
  }
}
