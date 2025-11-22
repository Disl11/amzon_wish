import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
//import du package carousel_slider + ajout dans pubspec.yaml

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'lib/assets/images/image1.jpg',
      'lib/assets/images/image2.jpg',
      'lib/assets/images/image3.jpg',
    ];
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
      items: images.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
