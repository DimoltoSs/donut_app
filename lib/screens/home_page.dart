import 'package:flutter/material.dart';
import 'package:proyecto_ejemplo1/utils/my_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<Widget> myTabs = [
  const MyTab(iconPath: 'lib/icons/donut.png', iconName: 'Donut'),
  const MyTab(iconPath: 'lib/icons/burger.png', iconName: 'Burger'),
  const MyTab(iconPath: 'lib/icons/smoothie.png', iconName: 'Smoothie'),
  const MyTab(iconPath: 'lib/icons/pancakes.png', iconName: 'Pancake'),
  const MyTab(iconPath: 'lib/icons/pizza.png', iconName: 'Pizza'),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
            // 1. Texto principal
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: const [
                  Text('I want to ', style: TextStyle(fontSize: 24)),
                  Text(
                    'Eat',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ), 

            const SizedBox(height: 24), 

            // 2. Pestañas (TabBar)
            TabBar(tabs: myTabs),

            // 3. Contenido de las pestañas (TabBarView)
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Text("Donut Page")),
                  Center(child: Text("Burger Page")),
                  Center(child: Text("Smoothie Page")),
                  Center(child: Text("Pancake Page")),
                  Center(child: Text("Pizza Page")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}