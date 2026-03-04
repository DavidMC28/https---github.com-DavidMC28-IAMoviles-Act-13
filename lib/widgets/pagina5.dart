import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 20, bottom: 30),
            width: double.infinity,
            color: Colors.lightBlue.shade100,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black), 
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      "Perfil",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Icon(Icons.account_circle, size: 100, color: Colors.black54),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                _profileItem(Icons.person, "Perfil", trailingIcon: Icons.edit),
                _profileItem(Icons.store, "Pagos y compras"),
                _profileItem(Icons.settings, "Ajustes"),
                _profileItem(Icons.location_on, "Ubicación"),
                _profileItem(Icons.nightlight_round, "Tema"),
              ],
            ),
          ),
        ],
      ),
      // Footer Celeste con icono de casa a Página 4 (Igual que Page 6)
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

  Widget _profileItem(IconData icon, String text, {IconData? trailingIcon}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black87, size: 28),
          title: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          trailing: trailingIcon != null ? Icon(trailingIcon, color: Colors.grey) : null,
          onTap: () {},
        ),
        const Divider(height: 1),
      ],
    );
  }
}