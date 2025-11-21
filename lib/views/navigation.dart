import 'package:amazonwish/views/home.dart';
import 'package:amazonwish/views/shoppingCard.dart';
import 'package:flutter/material.dart';

class NavigationBottom extends StatefulWidget {
  const NavigationBottom({super.key});

  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  int _selecedIndex = 0;

  void _navigationBottomBar(int index) {
    setState(() {
      _selecedIndex = index;
    });
  }

  final List<Widget> _pages = [Home(), Shoppingcard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orangeAccent),
      body: _pages[_selecedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orangeAccent,
        currentIndex: _selecedIndex,
        onTap: _navigationBottomBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cards",
          ),
        ],
      ),
    );
  }
}
