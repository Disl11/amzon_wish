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
  //méthode pour afficher les produits dans le carousel
  //et trier par rabais

  List<Product> getTopProduits({int limit = 4}) {
    List<Product> productsCopy = [];
    for (var product in products) {
      productsCopy.add(product);
    }

    //puis je trie par rabais (=discount percentage)
    productsCopy.sort((productA, productB) {
      if (productB.discountPercentage > productA.discountPercentage) {
        return 1;
      } else if (productB.discountPercentage < productA.discountPercentage) {
        return -1;
      } else {
        return 0;
      }
    });

    //et prendre les 3 premiers
    List<Product> result = [];
    for (int i = 0; i < limit && i < productsCopy.length; i++) {
      result.add(productsCopy[i]);
    }
    return result;
  }
}
