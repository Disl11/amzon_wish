import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../models/product.dart';
//import du package carousel_slider + ajout dans pubspec.yaml

class BannerSlider extends StatelessWidget {
  final List<Product> products;
  const BannerSlider({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        //j'avais d'abord mis 200 mais trop petit par rapport au clone amazon donc 400 hauteur et modif' du ratio
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        enlargeCenterPage: true,
        //agrandit légèrement l'image au centre et réduit les images sur les côtés avec true = effet de zoom
        viewportFraction: 0.6,
        //à 0.9, l'image prend 90% de l'écran => on voit les côtés
      ),
      items: products.map((product) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              //colonne pour afficher la réduction
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),

                  child: Text(
                    '-${product.discountPercentage.toInt()}%',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                    child: Image.network(
                      product.thumbnail,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }
}
