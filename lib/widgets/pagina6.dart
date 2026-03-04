import 'package:flutter/material.dart';

class Page6 extends StatelessWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Celeste
          Container(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 20),
            width: double.infinity,
            color: Colors.lightBlue.shade100,
            child: Row(
              children: [
                // Flecha de retorno
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 10),
                // Icono hamburguesa
                const Icon(Icons.lunch_dining, size: 45, color: Colors.black),
                const SizedBox(width: 10),
                // Texto "comida"
                const Text(
                  "comida",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Barra de búsqueda Turquesa
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
                  const SizedBox(height: 25),
                  // Categorías
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _categoryIcon(Icons.local_drink, "bebidas"),
                      _categoryIcon(Icons.bakery_dining, "frituras"),
                      _categoryIcon(Icons.cookie, "botanas"),
                      _categoryIcon(Icons.flash_on, "energizantes"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Línea divisora 1 amarilla
                  const Divider(thickness: 8, color: Colors.yellow),
                  const SizedBox(height: 20),
                  // Productos
                  _productRow(),
                  const SizedBox(height: 20),
                  _productRow(),
                ],
              ),
            ),
          ),
          // Línea divisora 2 amarilla antes del footer
          const Divider(thickness: 8, color: Colors.yellow, height: 8),
        ],
      ),
      // Footer Celeste con icono de casa a Página 4
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.lightBlue.shade100,
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, '/page4'),
          child: const Icon(Icons.home, size: 35, color: Colors.blueAccent),
        ),
      ),
    );
  }

  Widget _categoryIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 35, color: Colors.black87),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _productRow() {
    final List<String> imageUrls = [
      'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/main/d1.jpg',
      'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/main/d2.jpg',
      'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/main/d3.jpg',
      'https://raw.githubusercontent.com/DavidMC28/imagenes-para-flutter-6to-I-11-feb-2026/main/fa.png',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imageUrls.map((url) => Container(
          margin: const EdgeInsets.only(right: 15),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              url,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red);
              },
            ),
          ),
        )).toList(),
      ),
    );
  }
}
