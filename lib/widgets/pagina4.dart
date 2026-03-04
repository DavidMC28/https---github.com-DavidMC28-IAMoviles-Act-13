import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 20, bottom: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.yellow, Colors.teal],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      "¡BIENVENIDO!",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                // Icono de perfil GRANDE y BLANCO
                IconButton(
                  icon: const Icon(Icons.account_circle, size: 45, color: Colors.white),
                  onPressed: () => Navigator.pushNamed(context, '/page5'),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _cardMenu(context, "Viaje", Icons.directions_car, Colors.red, null),
                        const SizedBox(width: 15),
                        // Acción para ir a la Página 6 (Comida)
                        _cardMenu(context, "Comida", Icons.fastfood, Colors.orange, '/page6'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: Row(
                      children: [
                        _cardMenu(context, "Entrega", Icons.inventory_2, const Color(0xFF8D6E63), null),
                        const SizedBox(width: 15),
                        _cardMenu(context, "Shop", Icons.shopping_basket, Colors.yellow.shade700, null),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Buscar...",
                      prefixIcon: const Icon(Icons.search, color: Colors.white70),
                      filled: true,
                      fillColor: Colors.teal.shade300,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: const TextStyle(color: Colors.white70),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.lightBlue.shade100,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, '/'),
          child: const Icon(Icons.home, size: 35, color: Colors.blueAccent),
        ),
      ),
    );
  }

  Widget _cardMenu(BuildContext context, String title, IconData icon, Color bgColor, String? route) {
    return Expanded(
      child: InkWell(
        onTap: route != null ? () => Navigator.pushNamed(context, route) : null,
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1)],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}