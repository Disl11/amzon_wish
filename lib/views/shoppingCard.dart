import 'package:amazonwish/viewModels/productsViewModel.dart';
import 'package:amazonwish/views/widgets/listViewRow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Shoppingcard extends StatefulWidget {
  const Shoppingcard({super.key});

  @override
  State<Shoppingcard> createState() => _ShoppingcardState();
}

class _ShoppingcardState extends State<Shoppingcard> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductsViewModel>(context);
    return Scaffold(
      body: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total: ${viewModel.getTotal().toStringAsFixed(2)} €",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Passer la commande"),
                      ),
                    ],
                  ),
                ),
                Divider(endIndent: 20, indent: 20, thickness: 3),
                Expanded(
                  child: viewModel.panier.isEmpty
                      ? Center(child: Text("Panier vide"))
                      : ListView.builder(
                          itemCount: viewModel.panier.length,
                          itemBuilder: (context, index) {
                            final product = viewModel.panier[index];
                            return Card(
                              margin: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: Column(
                                children: [
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          product.thumbnail,
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Divider(
                                    endIndent: 20,
                                    indent: 20,
                                    thickness: 3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.title,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              "${product.price} €",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            viewModel.remouvCart(product);
                                          },
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
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
