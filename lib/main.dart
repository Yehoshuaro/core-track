import 'package:flutter/material.dart';
import 'pages/home_page.dart';

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
