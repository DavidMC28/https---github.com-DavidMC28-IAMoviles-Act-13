import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.black), 
        onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.transparent, elevation: 0,
      ),
      bottomNavigationBar: const CustomFooter(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            RichText(text: const TextSpan(style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: 'Log ', style: TextStyle(color: Colors.pinkAccent)),
                TextSpan(text: 'In', style: TextStyle(color: Colors.amber)),
              ])),
            const SizedBox(height: 30),
            _inputGeneric("Login / email"),
            const SizedBox(height: 15),
            _inputGeneric("Password", isPass: true),
            const SizedBox(height: 30),
            _btnGeneric("Log in", Colors.teal.shade300, Colors.white, () => Navigator.pushNamed(context, '/page4')),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15), child: Text("or", style: TextStyle(fontSize: 18, color: Colors.grey))),
            _btnGeneric("Register", Colors.amber.shade300, Colors.pinkAccent, () => Navigator.pushNamed(context, '/page3')),
          ],
        ),
      ),
    );
  }
}


Widget _inputGeneric(String label, {bool isPass = false, bool isRounded = false}) => TextField(
  obscureText: isPass,
  decoration: InputDecoration(
    hintText: label,
    hintStyle: const TextStyle(color: Colors.black26),
    contentPadding: const EdgeInsets.all(18),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(isRounded ? 15 : 30),
      borderSide: BorderSide(color: isRounded ? Colors.teal : Colors.black12, width: 2)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(isRounded ? 15 : 30),
      borderSide: const BorderSide(color: Colors.pinkAccent, width: 2)
    ),
  ),
);

Widget _btnGeneric(String text, Color bg, Color fg, VoidCallback onPressed) => SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: bg,
      foregroundColor: fg,
      padding: const EdgeInsets.symmetric(vertical: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    child: Text(text),
  ),
);