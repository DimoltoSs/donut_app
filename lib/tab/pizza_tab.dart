import 'package:flutter/material.dart';
import '../utils/pizza_tile.dart';

class PizzaTab extends StatelessWidget {
  final void Function(String, String, dynamic, String) onAddToCart;
  PizzaTab({super.key, required this.onAddToCart});

  final List pizzasOnSale = [
    ['Pepperoni', '120', Colors.red, "lib/images/pepperoni_pizza.png", 'Domino\'s'],
    ['Hawaiian', '110', Colors.yellow, "lib/images/hawaian_pizza.png", 'Pizza Hut'],
    ['Veggie', '105', Colors.green, "lib/images/margherita_pizza.png", 'Little Caesars'],
    ['California', '90', Colors.orange, "lib/images/california_style_pizza.png", 'Papa John\'s'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 1 / 1.5),
      itemCount: pizzasOnSale.length,
      itemBuilder: (context, index) {
        return PizzaTile(
          pizzaFlavor: pizzasOnSale[index][0],
          pizzaPrice: pizzasOnSale[index][1],
          pizzaColor: pizzasOnSale[index][2],
          pizzaImagePath: pizzasOnSale[index][3],
          pizzaProvider: pizzasOnSale[index][4],
          onPressed: () => onAddToCart(
            pizzasOnSale[index][0],
            pizzasOnSale[index][1],
            pizzasOnSale[index][2],
            pizzasOnSale[index][3],
          ),
        );
      },
    );
  }
}