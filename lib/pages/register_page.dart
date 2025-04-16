import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void registerUser(BuildContext context) {
    final email = emailController.text.trim();
    final password = passwordController.text;
    final box = Hive.box('users');

    if (email.isNotEmpty && password.isNotEmpty) {
      if (box.containsKey(email)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User already exists")));
      } else {
        box.put(email, password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered successfully")));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fill all fields")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => registerUser(context), child: Text("Register")),
            TextButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage())), child: Text("Already have an account? Login")),
          ],
        ),
      ),
    );
  }
}
