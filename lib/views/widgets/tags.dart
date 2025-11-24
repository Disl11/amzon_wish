import 'package:amazonwish/models/product.dart';
import 'package:amazonwish/viewModels/productsViewModel.dart';
import 'package:amazonwish/views/categoryPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductsViewModel>(context);

    //on appel la medthoe pour récuper les category
    final categories = viewModel.getCategory();

    // return Scaffold(
    return viewModel.isLoading
        ? Center(child: CircularProgressIndicator())
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFFAB40),
                      Color(0xFFFFA34A),
                      Color(0xFFFF9C54),
                      Color(0xFFFF955D),
                      Color(0xFFFF8E63),
                      Color(0xFFFF8A65),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: 48,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Categorypage(category: category),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.white.withOpacity(0.5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              width: 130,
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    category,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
