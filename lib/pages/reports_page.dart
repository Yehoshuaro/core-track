import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  final _reportController = TextEditingController();
  final _titleController = TextEditingController();
  List<Map<String, dynamic>> _reports = [];

  @override
  void initState() {
    super.initState();
    _loadReports();
  }

  @override
  void dispose() {
    _reportController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _loadReports() async {
    final box = await Hive.openBox('reports');
    setState(() {
      _reports = List<Map<String, dynamic>>.from(box.values.toList());
    });
  }

  Future<void> _saveReport() async {
    if (_titleController.text.isEmpty || _reportController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in both title and report'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final box = await Hive.openBox('reports');
    final report = {
      'title': _titleController.text,
      'content': _reportController.text,
      'date': DateTime.now().toIso8601String(),
    };

    await box.add(report);
    _titleController.clear();
    _reportController.clear();
    _loadReports();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Report saved successfully'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: _reportController,
                decoration: const InputDecoration(
                  labelText: 'Write your report',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: null,
                expands: true,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _saveReport,
                child: const Text('Save Report'),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _reports.length,
                itemBuilder: (context, index) {
                  final report = _reports[index];
                  return Card(
                    child: ListTile(
                      title: Text(report['title']),
                      subtitle: Text(
                        report['content'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        DateTime.parse(report['date']).toString().split('.')[0],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 