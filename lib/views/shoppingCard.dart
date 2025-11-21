import 'package:flutter/material.dart';

class Shoppingcard extends StatefulWidget {
  const Shoppingcard({super.key});

  @override
  State<Shoppingcard> createState() => _ShoppingcardState();
}

class _ShoppingcardState extends State<Shoppingcard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Page shopping Card")));
  }
}
