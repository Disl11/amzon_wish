import 'package:amazonwish/views/widgets/carousel_view.dart';
import 'package:amazonwish/views/widgets/gridview.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Page Home")));
  }
}

//**********************TEST CAROUSEL********************************** */
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:amazonwish/views/widgets/carousel_view.dart';
// import 'package:amazonwish/viewModels/productsViewModel.dart';

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // charger les produits dès le build
//     final viewModel = Provider.of<ProductsViewModel>(context);
//     if (viewModel.products.isEmpty && viewModel.isLoading) {
//       viewModel.loadProducts();
//     }

//     return Scaffold(
//       body: viewModel.isLoading
//          ? const Center(
//               child: CircularProgressIndicator(color: Color(0xFFFF9900)),
//             )
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Carousel avec les produits en promo
//                   BannerSlider(products: viewModel.getTopProduits(limit: 5)),

//                   const SizedBox(height: 20),

//                   const Text('home à construire'),
//                 ],
//               ),
//             ),
//     );
//   }
// }
