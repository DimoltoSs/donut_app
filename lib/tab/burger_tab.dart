import 'package:flutter/material.dart';
import '../utils/burger_tile.dart';

class BurgerTab extends StatelessWidget {
  final void Function(String, String, dynamic, String) onAddToCart;
  BurgerTab({super.key, required this.onAddToCart});

  final List burgersOnSale = [
    ['Original', '95', Colors.amber, "lib/images/original_burger.png", 'Burger King'],
    ['Bacon', '115', Colors.red, "lib/images/bacon_burger.png", 'Wendy\'s'],
    ['Chicken', '85', Colors.orange, "lib/images/chicken_burger.png", 'KFC'],
    ['Triple', '150', Colors.brown, "lib/images/triple_burger.png", 'McDonald\'s'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: burgersOnSale.length,
      itemBuilder: (context, index) {
        return BurgerTile(
          burgerFlavor: burgersOnSale[index][0],
          burgerPrice: burgersOnSale[index][1],
          burgerColor: burgersOnSale[index][2],
          burgerImagePath: burgersOnSale[index][3],
          burgerProvider: burgersOnSale[index][4],
          onPressed: () => onAddToCart(
            burgersOnSale[index][0],
            burgersOnSale[index][1],
            burgersOnSale[index][2],
            burgersOnSale[index][3],
          ),
        );
      },
    );
  }
}