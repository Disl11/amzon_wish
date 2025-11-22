import 'package:amazonwish/api/api.dart';
import 'package:amazonwish/models/product.dart';
import 'package:flutter/material.dart';

class ProductsViewModel extends ChangeNotifier {
  List<Product> products = [];
  bool isLoading = true;

  Future loadProducts() async {
    final fetchProducts = await ProductsRepo.getProducts();

    products = fetchProducts.take(10).toList();

    isLoading = false;
    notifyListeners();
  }
}
