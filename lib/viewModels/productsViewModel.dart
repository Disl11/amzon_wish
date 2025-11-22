import 'package:amazonwish/api/api.dart';
import 'package:amazonwish/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductsViewModel extends ChangeNotifier {
  List<Product> products = [];
  bool isLoading = true;

  Future loadProducts() async {
    final fetchProducts = await ProductsRepo.getProducts();

    products = fetchProducts;

    isLoading = false;
    notifyListeners();
  }

  //recuperation des category
  List<String> getCategory() {
    final category = products.map((p) => p.category).toSet().toList();
    return category;
  }

  //retrouner les produit filtré par catégori

  List<Product> getProductsByCategory(String category) {
    return products.where((p) => p.category == category).toList();
  }
}
