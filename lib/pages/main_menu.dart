import 'package:flutter/material.dart';
import 'my_room_page.dart';
import 'main_reglog.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FOS'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.palette),
            tooltip: 'Themes',
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'dark',
                child: Row(
                  children: [
                    Icon(Icons.dark_mode),
                    SizedBox(width: 8),
                    Text('Dark Theme'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'light',
                child: Row(
                  children: [
                    Icon(Icons.light_mode),
                    SizedBox(width: 8),
                    Text('Light Theme'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'brutal',
                child: Row(
                  children: [
                    Icon(Icons.whatshot),
                    SizedBox(width: 8),
                    Text('Brutal Theme'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'elegant',
                child: Row(
                  children: [
                    Icon(Icons.diamond),
                    SizedBox(width: 8),
                    Text('Elegant Theme'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'cute',
                child: Row(
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(width: 8),
                    Text('Cute Theme'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'nature',
                child: Row(
                  children: [
                    Icon(Icons.eco),
                    SizedBox(width: 8),
                    Text('Nature Theme'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              // TODO: Implement theme switching
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyRoomPage()),
                );
              },
              icon: const Icon(Icons.person),
              label: const Text('My Room'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const MainRegLog()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.logout),
              label: const Text('Quit'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 