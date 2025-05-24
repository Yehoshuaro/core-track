import 'package:flutter/material.dart';

class PlansGoalsPage extends StatefulWidget {
  const PlansGoalsPage({super.key});

  @override
  State<PlansGoalsPage> createState() => _PlansGoalsPageState();
}

class _PlansGoalsPageState extends State<PlansGoalsPage> {
  final List<Map<String, dynamic>> _goals = [];
  final _goalController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _addGoal() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Goal'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _goalController,
              decoration: const InputDecoration(
                hintText: 'Enter goal title',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                hintText: 'Enter goal description',
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_goalController.text.isNotEmpty) {
                setState(() {
                  _goals.add({
                    'title': _goalController.text,
                    'description': _descriptionController.text,
                    'completed': false,
                  });
                });
                _goalController.clear();
                _descriptionController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _toggleGoal(int index) {
    setState(() {
      _goals[index]['completed'] = !_goals[index]['completed'];
    });
  }

  void _deleteGoal(int index) {
    setState(() {
      _goals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plans & Goals'),
      ),
      body: ListView.builder(
        itemCount: _goals.length,
        itemBuilder: (context, index) {
          final goal = _goals[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Checkbox(
                value: goal['completed'],
                onChanged: (_) => _toggleGoal(index),
              ),
              title: Text(
                goal['title'],
                style: TextStyle(
                  decoration: goal['completed'] ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Text(goal['description']),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _deleteGoal(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addGoal,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _goalController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
} 