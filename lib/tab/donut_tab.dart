import 'package:flutter/material.dart';
import '../utils/donut_tile.dart';

class DonutTab extends StatelessWidget {
  final void Function(String, String, dynamic, String) onAddToCart;
  DonutTab({super.key, required this.onAddToCart});

  final List donutOnSale = [
    ['Chocolate', '100', Colors.brown, "lib/images/chocolate_donut.png", 'Starbucks'],
    ['Strawberry', '89', Colors.red, "lib/images/strawberry_donut.png", 'Krispy Kreme'],
    ['Ice Cream', '95', Colors.blue, "lib/images/icecream_donut.png", "Dunkin' Donuts"],
    ['Grape', '70', Colors.purple, "lib/images/grape_donut.png", 'Oxxo'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutOnSale.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutOnSale[index][0],
          donutPrice: donutOnSale[index][1],
          donutColor: donutOnSale[index][2],
          donutImagePath: donutOnSale[index][3],
          donutProvider: donutOnSale[index][4],
          onPressed: () => onAddToCart(
            donutOnSale[index][0],
            donutOnSale[index][1],
            donutOnSale[index][2],
            donutOnSale[index][3],
          ),
        );
      },
    );
  }
}