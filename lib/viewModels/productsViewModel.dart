import 'package:amazonwish/api/api.dart';
import 'package:amazonwish/models/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductsViewModel extends ChangeNotifier {
  List<Product> products = [];
  List<Product> panier = [];
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

  // afficher Images des categories

  final Map<String, String> categoryImage = {
    "beauty": "lib/assets/images/beuté.jpg",
    "fragrances": "lib/assets/images/fragrances.jpg",
    "furniture": "lib/assets/images/furniture.jpg",
    "groceries": "lib/assets/images/groceries.jpg",
  };

  String getCategoryImage(String category) {
    return categoryImage[category] ?? " ";
  }

  // ajouter un produit au panier
  void addCart(Product product) {
    panier.add(product);
    notifyListeners();
  }

  // Supprimer un produit du panier
  void remouvCart(Product product) {
    panier.remove(product);
    notifyListeners();
  }

  //calculer le total
  double getTotal() {
    double total = 0;
    for (var product in panier) {
      total += product.price;
    }
    return total;
  }

  //méthode pour une card : afficher 4 produits à moins de 50 euros
  List<Product> getProductsPrixReduit({int limit = 4}) {
    List<Product> result = [];
    for (var product in products) {
      if (product.price < 50) {
        result.add(product);
      }
      if (result.length >= limit) {
        break;
      }
    }
    return result;
  }

  //méthode pour la card des produits les mieux notés
  //j'applique la même logique que pour les réductions

  List<Product> getBestRatedProducts({int limit = 4}) {
    List<Product> productsCopy = [];
    for (var product in products) {
      productsCopy.add(product);
    }
    //puis je trie
    productsCopy.sort((productA, productB) {
      if (productB.rating > productA.rating) {
        return 1;
      } else if (productA.rating > productB.rating) {
        return -1;
      } else {
        return 0;
      }
    });
    //et on garde les premiers sans limite (on limite dans la view)
    List<Product> result = [];
    for (int i = 0; i < limit && i < productsCopy.length; i++) {
      result.add(productsCopy[i]);
    }
    return result;
  }

  //méthode pour les produits premium à plus de 200 euros
  List<Product> getPremiumProducts({int limit = 4}) {
    List<Product> result = [];
    for (var product in products) {
      if (product.price > 200) {
        result.add(product);
      }
      if (result.length >= limit) {
        break;
      }
    }

    return result;
  }
}
