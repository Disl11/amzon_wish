import 'package:amazonwish/models/product.dart';
import 'package:amazonwish/viewModels/productsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Listviewrow extends StatefulWidget {
  const Listviewrow({super.key});

  @override
  State<Listviewrow> createState() => _ListviewrowState();
}

class _ListviewrowState extends State<Listviewrow> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductsViewModel>(context);

    return Scaffold(
      body: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.products.length,
                    itemBuilder: (context, index) {
                      final product = viewModel.products[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(product.thumbnail),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              product.category,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
