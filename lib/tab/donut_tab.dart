import 'package:flutter/material.dart';

class DonutTab extends StatelessWidget {
   DonutTab({super.key});

  //List of donuts
  final List donutOnSale = [
    // donutFlavor, donutPrice, donutColor, donutImagePath, donutProvider
    [
      'Chocolate',
      '100',
      Colors.brown,
      "lib/images/chocolate_donut.png",
      'Starbucks',
    ],
    [
      'Strawberry',
      '89',
      Colors.red,
      "lib/images/strawberry_donut.png",
      'Krispy Kreme',
    ],
    [
      'Ice Cream',
      '95',
      Colors.blue,
      "lib/images/icecream_donut.png",
      "Dunkin' Donuts",
    ],
    ['Grape', '70', Colors.purple, "lib/images/grape_donut.png", 'Oxxo'],
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //Cantidad de columnas fijas
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: donutOnSale.length, 
      itemBuilder: DonutTile(
        donutFlavor: donutOnSale[index][0],
        donutPrice: donutOnSale[index][1],
        donutColor: donutOnSale[index][2],
        donutImagePath: donutOnSale[index][3],
        donutProvider: donutOnSale[index][4],
      ),
      );)
  }
}