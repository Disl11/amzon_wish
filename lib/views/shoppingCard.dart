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
                        "Total:",
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
                              child: ListTile(
                                leading: Image.network(
                                  product.thumbnail,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(product.title),
                                subtitle: Text("${product.price} €"),
                                trailing: IconButton(
                                  onPressed: () {
                                    viewModel.remouvCart(product);
                                  },
                                  icon: Icon(Icons.delete),
                                ),
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
