import 'package:amazonwish/viewModels/productsViewModel.dart';
import 'package:amazonwish/views/navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsViewModel()..loadProducts(),
        ),
      ],
      child: MaterialApp(title: 'Amazon Wish', home: NavigationBottom()),
    );
  }
}
