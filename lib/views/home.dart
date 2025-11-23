import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amazonwish/views/widgets/carousel_view.dart';
import 'package:amazonwish/views/widgets/gridview.dart';
import 'package:amazonwish/views/widgets/listViewRow.dart';
import 'package:amazonwish/viewModels/productsViewModel.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductsViewModel>(context);

    if (viewModel.products.isEmpty && viewModel.isLoading) {
      viewModel.loadProducts();
    }

    return viewModel.isLoading
        ? const Center(
            child: CircularProgressIndicator(color: Color(0xFFFF9900)),
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                //utilisation du widget carousel
                BannerSlider(products: viewModel.getTopProduits(limit: 5)),

                const SizedBox(height: 20),

                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Black Friday Week aura lieu du 20 novembre au 1 décembre",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // utilisation du widget list row par catégories
                const Listviewrow(),

                const SizedBox(height: 20),

                // utilisation du widget cards
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Nos sélections à découvrir',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 10),

                // utilisation du widget grid
                HorizontalGrid(
                  discountproducts: viewModel.getProductsPrixReduit(limit: 4),

                  topRatedProducts: viewModel.getBestRatedProducts(limit: 4),
                  premiumProducts: viewModel.getPremiumProducts(limit: 4),
                ),

                const SizedBox(height: 20),
              ],
            ),
          );
  }
}
