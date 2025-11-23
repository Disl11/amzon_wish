//Widget réutilisable : grid
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/productsViewModel.dart';
import '../../models/product.dart';
import '../productDetails.dart';

class HorizontalGrid extends StatelessWidget {
  final List<Product> discountproducts;
  final List<Product> topRatedProducts;
  final List<Product> premiumProducts;

  const HorizontalGrid({
    super.key,
    required this.discountproducts,
    required this.topRatedProducts,
    required this.premiumProducts,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // Card 1
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              color: const Color.fromARGB(255, 241, 132, 60),
              child: SizedBox(
                width: 350,
                child: Column(
                  children: [
                    //je crée une colonne pour pouvoir mettre du texte
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Les bonnes affaires à moins de 50 €',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // et la GRID à 4 items
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(8),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.7,
                        // children: List.generate(4, (index) {
                        //modifier pour adapter aux données
                        children: discountproducts.map((product) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetail(product: product),
                                ),
                              );
                            },
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      product.thumbnail,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // Prix
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '\$${product.price}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Card 2
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              color: const Color.fromARGB(255, 241, 132, 60),
              child: SizedBox(
                width: 350,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Produits les mieux notés',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // la grid à 4 items
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(8),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.7,
                        // children: List.generate(4, (index) {
                        //modifier pour adapter aux données
                        children: topRatedProducts.map((product) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetail(product: product),
                                ),
                              );
                            },
                            child: Container(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      product.thumbnail,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // rating
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '${product.rating}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Card 3
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              color: const Color.fromARGB(255, 241, 132, 60),
              child: SizedBox(
                width: 350,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Nos produits Premium à saisir',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // la grid à 4 items
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(8),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.7,
                        // children: List.generate(4, (index) {
                        //modifier pour adapter aux données
                        children: premiumProducts.map((product) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetail(product: product),
                                ),
                              );
                            },
                            child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      product.thumbnail,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // affiche le title
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      '${product.title}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
