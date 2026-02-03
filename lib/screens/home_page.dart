import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.transparent,
      // El primer elemento de la barra
      leading: Icon(Icons.menu, color: Colors.grey[800],),

      // Ultimo elemento de la barra
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Icon(Icons.person, color: Colors.grey[800]),
        ),
      ],
    ),
    body: Column(
      // 1. Texto principal

      //2. Pestañas (TabBar)

      //3. Contenido de las pestañas (TabBarView)

      //4. Carrito
      
    ),

    );
  }
}