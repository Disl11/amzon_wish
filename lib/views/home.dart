import 'package:amazonwish/views/widgets/tags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amazonwish/views/widgets/carousel_view.dart';
import 'package:amazonwish/views/widgets/gridview.dart';
import 'package:amazonwish/views/widgets/listViewRow.dart';
import 'package:amazonwish/viewModels/productsViewModel.dart';
import 'package:amazonwish/views/widgets/grid2view.dart';

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
                Tags(),

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
                      "Le Black Friday Week a lieu du 20 novembre au 1er décembre",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,

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
                //pour faire que 3 grid soient sur une ligne et 3 grid en dessous
                HorizontalGrid(
                  discountproducts: viewModel.getProductsPrixReduit(limit: 4),

                  topRatedProducts: viewModel.getBestRatedProducts(limit: 4),
                  premiumProducts: viewModel.getPremiumProducts(limit: 4),

                  //comment faire pour faire que ce ce grid là soit placé en dessous des 2 autres grids
                ),

                const SizedBox(height: 30),

                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Découvrez nos sélections par catégorie",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                HorizontalGrid2(
                  category1Products: viewModel
                      .getProductsByCategory('beauty')
                      .take(4)
                      .toList(),
                  category2Products: viewModel
                      .getProductsByCategory('fragrances')
                      .take(4)
                      .toList(),
                  category3Products: viewModel
                      .getProductsByCategory('furniture')
                      .take(4)
                      .toList(),
                ),

                const SizedBox(height: 30),

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
                      "Le black friday est là ! ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
