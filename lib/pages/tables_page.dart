import 'package:flutter/material.dart';

class TablesPage extends StatefulWidget {
  const TablesPage({super.key});

  @override
  State<TablesPage> createState() => _TablesPageState();
}

class _TablesPageState extends State<TablesPage> {
  final List<Map<String, dynamic>> _tables = [];
  final _tableNameController = TextEditingController();
  final _columnController = TextEditingController();
  List<String> _columns = [];
  List<List<String>> _rows = [];

  void _addTable() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Table'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _tableNameController,
              decoration: const InputDecoration(
                hintText: 'Enter table name',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _columnController,
              decoration: const InputDecoration(
                hintText: 'Enter column names (comma-separated)',
              ),
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
              if (_tableNameController.text.isNotEmpty && _columnController.text.isNotEmpty) {
                setState(() {
                  _columns = _columnController.text.split(',').map((e) => e.trim()).toList();
                  _rows = [];
                  _tables.add({
                    'name': _tableNameController.text,
                    'columns': _columns,
                    'rows': _rows,
                  });
                });
                _tableNameController.clear();
                _columnController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _addRow(int tableIndex) {
    final table = _tables[tableIndex];
    final controllers = List.generate(
      table['columns'].length,
      (_) => TextEditingController(),
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Row'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            table['columns'].length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                controller: controllers[index],
                decoration: InputDecoration(
                  labelText: table['columns'][index],
                ),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _tables[tableIndex]['rows'].add(
                  controllers.map((c) => c.text).toList(),
                );
              });
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _deleteTable(int index) {
    setState(() {
      _tables.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tables'),
      ),
      body: ListView.builder(
        itemCount: _tables.length,
        itemBuilder: (context, tableIndex) {
          final table = _tables[tableIndex];
          return Card(
            margin: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    table['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => _addRow(tableIndex),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteTable(tableIndex),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: table['columns'].map<DataColumn>((column) {
                      return DataColumn(
                        label: Text(column),
                      );
                    }).toList(),
                    rows: table['rows'].map<DataRow>((row) {
                      return DataRow(
                        cells: row.map<DataCell>((cell) {
                          return DataCell(Text(cell));
                        }).toList(),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTable,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _tableNameController.dispose();
    _columnController.dispose();
    super.dispose();
  }
} 