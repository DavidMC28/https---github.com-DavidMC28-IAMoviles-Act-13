import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: const CustomFooter(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: 'Regi', style: TextStyle(color: Colors.pinkAccent)),
                  TextSpan(text: 'ster', style: TextStyle(color: Colors.amber)),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _regField(Icons.person_outline, "User"),
            _regField(Icons.phone_outlined, "Phone"),
            _regField(Icons.email_outlined, "Email"),
            _regField(Icons.lock_outline, "Password", isPass: true),
            _regField(Icons.lock_outline, "Confirm Password", isPass: true),
            const SizedBox(height: 30),
            _btnGeneric("Create Account", Colors.amber.shade300, Colors.pinkAccent, () => Navigator.pushNamed(context, '/page4')),
            const SizedBox(height: 15),
            _btnGeneric("Cancel", Colors.red.shade300, Colors.white, () => Navigator.pop(context)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _regField(IconData icon, String hint, {bool isPass = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(child: _inputGeneric(hint, isPass: isPass, isRounded: true)),
        ],
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
