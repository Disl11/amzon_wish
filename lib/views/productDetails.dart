//view pour l'affichage en détails d'un produit

import 'package:amazonwish/viewModels/productsViewModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // affiche d'abord l'image
              // Image.network(
              //   product.thumbnail,
              //   height: 200,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              //pour récupérer les toutes les images de dummy Json en mode carousel
              SizedBox(
                height: 300,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                  ),
                  items: product.images.map((imageUrl) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              const SizedBox(height: 20),

              // puis le itle
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // le price
              Text(
                '${product.price} €',
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // la réduction
              Text(
                'Taux de remise : ${product.discountPercentage}%',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 10),

              // la note
              Text(
                'Note : ${product.rating}',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 10),

              // le stock disponible
              Text(
                'Stock : ${product.stock}',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 10),

              // la marque
              Text(
                'Marque : ${product.brand}',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 10),

              // la catégorie
              Text(
                'Catégorie : ${product.category}',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              // la description
              Text(
                'Description :',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(product.description, style: const TextStyle(fontSize: 16)),

              ElevatedButton(
                onPressed: () {
                  viewModel.addCart(product);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 244, 206, 15),
                ),
                child: const Text(
                  "Ajouter au panier",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
