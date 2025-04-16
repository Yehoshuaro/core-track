import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/feature_item.dart';
import 'login_page.dart';
import 'register_page.dart';

class RoyalHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Header(
          onLogin: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          onRegister: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                      'What is the CoreTrack application? ...',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    FeatureItem(
                      title: 'Reporting',
                      description:
                      'Choose to view summaries by months, quarters, half-years, or years',
                    ),
                    FeatureItem(
                      title: 'Tables',
                      description: 'Access data in structured table formats like Excel. Great for analysis',
                    ),
                    FeatureItem(
                      title: 'To-Do List',
                      description: 'Organize daily tasks and improve productivity with a simple checklist',
                    ),
                    FeatureItem(
                      title: 'Goals & Plans',
                      description: 'Set goals and future plans to stay focused and track your progress',
                    ),
                    FeatureItem(
                      title: 'Login / Register',
                      description: 'Create an account or log in to save and access your personal data',
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
}
