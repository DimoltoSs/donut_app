import 'package:flutter/material.dart';
import '../utils/smoothie_tile.dart';

class SmoothieTab extends StatelessWidget {
  final void Function(String, String, dynamic, String) onAddToCart;
  SmoothieTab({super.key, required this.onAddToCart});

  final List smoothiesOnSale = [
    ['Strawberry', '65', Colors.pink, "lib/images/strawberry_smoothie.png", 'Nutrisa'],
    ['Vainilla', '60', Colors.yellow, "lib/images/vainilla_smoothie.png", 'Santa Clara'],
    ['Frappe', '70', Colors.green, "lib/images/frappe_smoothie.png", 'Natural B'],
    ['Choco', '75', Colors.brown, "lib/images/chocolate_smoothie.png", 'Dairy Queen'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: smoothiesOnSale.length,
      itemBuilder: (context, index) {
        return SmoothieTile(
          smoothieFlavor: smoothiesOnSale[index][0],
          smoothiePrice: smoothiesOnSale[index][1],
          smoothieColor: smoothiesOnSale[index][2],
          smoothieImagePath: smoothiesOnSale[index][3],
          smoothieProvider: smoothiesOnSale[index][4],
          onPressed: () => onAddToCart(
            smoothiesOnSale[index][0],
            smoothiesOnSale[index][1],
            smoothiesOnSale[index][2],
            smoothiesOnSale[index][3],
          ),
        );
      },
    );
  }
}