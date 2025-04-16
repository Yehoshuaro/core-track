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

                // Login and Registration
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


      // This is My body

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF002366).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to the CoreTrack',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF002366),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'What is the CoreTrack application? Based on the FOS method (Full-Objective System)'
                          ' - it is more than just a tracker. It is a tool for objective self-diagnosis, '
                          '"accounting Your own life". This is not just another nonsense with self-development,'
                          ' it is rather something connected with the phrase "Compete with yesterday You". '
                          'Analysis of yourself, a look at your past and future from the outside, where you '
                          'are your own lawyer, your own prosecutor and your own judge. '
                          'Here’s what you can do using the navigation menu:',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    _buildFeatureItem(
                      title: 'Reporting',
                      description:
                      'Choose to view summaries by months, quarters, half-years, or years',
                    ),
                    _buildFeatureItem(
                      title: 'Tables',
                      description:
                      'Access data in structured table formats like Excel. Great for analysis',
                    ),
                    _buildFeatureItem(
                      title: 'To-Do List',
                      description:
                      'Organize daily tasks and improve productivity with a simple checklist',
                    ),
                    _buildFeatureItem(
                      title: 'Goals & Plans',
                      description:
                      'Set goals and future plans to stay focused and track your progress',
                    ),
                    _buildFeatureItem(
                      title: 'Login / Register',
                      description:
                      'Create an account or log in to save and access your personal data',
                    ),
                  ],
                ),
              ),
            ],
          ),
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

  Widget _buildFeatureItem({required String title, required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_outline, color: Color(0xFF002366)),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0xFF002366),
                  ),
                ),
                SizedBox(height: 4),
                Text(description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
