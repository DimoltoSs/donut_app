import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import '../tab/burger_tab.dart';
import '../tab/donut_tab.dart';
import '../tab/pancake_tab.dart';
import '../tab/pizza_tab.dart';
import '../tab/smoothie_tab.dart';
import '../utils/my_tab.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CartItem> userCart = [];

  List<Widget> myTabs = [
    const MyTab(iconPath: 'lib/icons/donut.png', iconName: 'Donut'),
    const MyTab(iconPath: 'lib/icons/burger.png', iconName: 'Burger'),
    const MyTab(iconPath: 'lib/icons/smoothie.png', iconName: 'Smoothie'),
    const MyTab(iconPath: 'lib/icons/pancakes.png', iconName: 'Pancake'),
    const MyTab(iconPath: 'lib/icons/pizza.png', iconName: 'Pizza'),
  ];

  void addToCart(String name, String price, dynamic color, String image) {
    setState(() {
      userCart.add(CartItem(
        name: name,
        price: price,
        color: color,
        imagePath: image,
      ));
    });
  }

  void removeFromCart(int index) {
    setState(() {
      userCart.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = userCart.fold(0, (sum, item) => sum + double.parse(item.price));

    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.grey[800]),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Icon(Icons.person, color: Colors.grey[800]),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: const [
                  Text('I want to ', style: TextStyle(fontSize: 24)),
                  Text('Eat', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
                ],
              ),
            ),
            const SizedBox(height: 24),
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
                        Text('${userCart.length} Items | \$${total.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const Text('Delivery Charges Included', style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(
                            cart: userCart,
                            onRemove: removeFromCart,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[300]),
                    child: const Text('View Cart', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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