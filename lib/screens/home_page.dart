import 'package:flutter/material.dart';
import 'package:proyecto_ejemplo1/utils/my_tab.dart';
import '../tab/burger_tab.dart';
import '../tab/donut_tab.dart';
import '../tab/pancake_tab.dart';
import '../tab/pizza_tab.dart';
import '../tab/smoothie_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int itemsInCart = 0;
  double totalPrice = 0.0;

  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png', iconName: 'Donut'),
    const MyTab(iconPath: 'lib/icons/burger.png', iconName: 'Burger'),
    const MyTab(iconPath: 'lib/icons/smoothie.png', iconName: 'Smoothie'),
    const MyTab(iconPath: 'lib/icons/pancakes.png', iconName: 'Pancake'),
    const MyTab(iconPath: 'lib/icons/pizza.png', iconName: 'Pizza'),
  ];

  void addToCart(String name, String price) {
    setState(() {
      itemsInCart++;
      totalPrice += double.parse(price);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name añadido al carrito'),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Icon(Icons.menu, color: Colors.grey[800], size: 36),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey[800], size: 36),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 18),
              child: Row(
                children: const [
                  Text("I want to ", style: TextStyle(fontSize: 24)),
                  Text("EAT",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline)),
                ],
              ),
            ),
            TabBar(tabs: myTabs),
            Expanded(
              child: TabBarView(
                children: [
                  DonutTab(onAddToCart: addToCart),
                  BurgerTab(onAddToCart: addToCart),
                  SmoothieTab(onAddToCart: addToCart),
                  PancakeTab(onAddToCart: addToCart),
                  PizzaTab(onAddToCart: addToCart),
                ],
              ),
            ),
            // Carrito dinámico
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$itemsInCart Items | \$${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Delivery Charges Included',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      )),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[300]),
                    child: const Text(
                      'View Cart',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}