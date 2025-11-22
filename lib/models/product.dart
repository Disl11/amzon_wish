//Modèle de données pour le produit
class Product {
  final int id; //id
  final String title; //titre
  final String description; //description
  final double price; //prix
  final double discountPercentage; //pourcentage de réduction
  final double rating; //classement produit
  final int stock; //stock
  final String brand; //marque
  final String category; //catégorie du produit
  final String thumbnail; //image du produit
  final List<String> images; //plusieurs images plus détaillées du produit

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  //hydrater les données = créer un product depuis JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      stock: json['stock'],
      brand: json['brand'] ?? '',
      //des produits de dummy peuvent ne pas avoir de 'brand' d'où la chaine de caractères si null
      category: json['category'] ?? '',
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images']),
    );
  }
}
