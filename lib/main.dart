import 'package:flutter/material.dart';

void main() {
  runApp(MyRoyalApp());
}

class MyRoyalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoreTrack - Home Page',
      theme: ThemeData(
        primaryColor: Color(0xFF002366),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
        ),
      ),
      home: RoyalHomePage(),
    );
  }
}

class RoyalHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Container(
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

                // My Main menu
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
//Login and Registration
                Row(
                  children: [
                    _buildActionButton("Login", Colors.white, Colors.black),
                    SizedBox(width: 10),
                    _buildActionButton("Register", Colors.amber, Colors.black),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to My App  ',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildNavButton(String title) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _buildDropdownButton(String title, List<String> items) {
    return PopupMenuButton<String>(
      onSelected: (value) {},
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
      itemBuilder: (context) {
        return items.map((item) {
          return PopupMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList();
      },
    );
  }

  Widget _buildActionButton(String title, Color bgColor, Color textColor) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(title),
    );
  }
}
