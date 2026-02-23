import 'package:flutter/material.dart';
import '../utils/pancake_tile.dart';

class PancakeTab extends StatelessWidget {
  final void Function(String, String, dynamic, String) onAddToCart;
  PancakeTab({super.key, required this.onAddToCart});

  final List pancakesOnSale = [
    ['Original', '60', Colors.orange, "lib/images/original_pancake.png", 'IHOP'],
    ['Strawberry', '75', Colors.red, "lib/images/strawberry_pancake.png", 'Denny\'s'],
    ['Spring', '85', Colors.green, "lib/images/spring_pancake.png", 'Crepe Place'],
    ['Crepe', '95', Colors.purple, "lib/images/crepe_pancake.png", 'La Crepería'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: pancakesOnSale.length,
      itemBuilder: (context, index) {
        return PancakeTile(
          pancakeFlavor: pancakesOnSale[index][0],
          pancakePrice: pancakesOnSale[index][1],
          pancakeColor: pancakesOnSale[index][2],
          pancakeImagePath: pancakesOnSale[index][3],
          pancakeProvider: pancakesOnSale[index][4],
          onPressed: () => onAddToCart(
            pancakesOnSale[index][0],
            pancakesOnSale[index][1],
            pancakesOnSale[index][2],
            pancakesOnSale[index][3],
          ),
        );
      },
    );
  }
}