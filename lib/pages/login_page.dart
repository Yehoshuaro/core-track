import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'register_page.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginUser(BuildContext context) {
    final box = Hive.box('users');
    final email = emailController.text.trim();
    final password = passwordController.text;

    final storedPassword = box.get(email);
    if (storedPassword == password) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => RoyalHomePage()));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid email or password")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => loginUser(context), child: Text("Login")),
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage())), child: Text("Don't have an account? Go to Register")),
            TextButton(onPressed: () => _showResetDialog(context), child: Text("Forgot password?"))
          ],
        ),
      ),
    );
  }

  void _showResetDialog(BuildContext context) {
    final resetController = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Reset Password"),
        content: TextField(controller: resetController, decoration: InputDecoration(labelText: "Enter your email")),
        actions: [
          TextButton(
            onPressed: () {
              final box = Hive.box('users');
              final email = resetController.text.trim();
              final newPassword = "bgtiz9UEMM";
              if (box.containsKey(email)) {
                box.put(email, newPassword);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("New password: $newPassword")));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email not found")));
              }
              Navigator.pop(context);
            },
            child: Text("Reset"),
          )
        ],
      ),
    );
  }
}
