//Widget réutilisable : grid
import 'package:flutter/material.dart';

class HorizontalGrid extends StatelessWidget {
  const HorizontalGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // Card 1
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              color: Colors.yellow,
              child: SizedBox(
                width: 350,
                child: Column(
                  children: [
                    //je crée une colonne pour pouvoir mettre du texte
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Catégorie Bidule',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // et la GRID à 4 items
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(8),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.7,
                        children: List.generate(4, (index) {
                          return Container(
                            color: Colors.teal,
                            child: Center(child: Text('Item')),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Card 2
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              color: Colors.blue,
              child: SizedBox(
                width: 350,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Catégorie Truc',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // la grid à 4 items
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(8),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.7,
                        children: List.generate(4, (index) {
                          return Container(
                            color: Colors.green,
                            child: Center(child: Text('Item')),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Card 3
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              color: const Color.fromARGB(255, 242, 143, 51),
              child: SizedBox(
                width: 350,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Catégorie Machin',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // la grid à 4 items
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(8),
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.7,
                        children: List.generate(4, (index) {
                          return Container(
                            color: const Color.fromARGB(255, 247, 115, 177),
                            child: Center(child: Text('Item')),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
