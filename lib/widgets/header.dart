import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final VoidCallback onLogin;
  final VoidCallback onRegister;

  const Header({
    required this.onLogin,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF002366),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "👑CoreTrack",
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                _buildDropdownButton("Reporting", [
                  "Months",
                  "Quarters",
                  "Half-Years",
                  "Years",
                ]),
                SizedBox(width: 20),
                _buildNavButton("Tables"),
                SizedBox(width: 20),
                _buildNavButton("To-Do List"),
                SizedBox(width: 20),
                _buildNavButton("Goals & Plans"),
              ],
            ),
            Row(
              children: [
                _buildActionButton("Login", Colors.white, Colors.black, onLogin),
                SizedBox(width: 10),
                _buildActionButton("Register", Colors.amber, Colors.black, onRegister),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String title) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  Widget _buildDropdownButton(String title, List<String> items) {
    return PopupMenuButton<String>(
      onSelected: (value) {},
      child: Row(
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
          Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
      itemBuilder: (context) {
        return items.map((item) => PopupMenuItem(value: item, child: Text(item))).toList();
      },
    );
  }

  Widget _buildActionButton(String title, Color bgColor, Color textColor, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(title),
    );
  }
}
