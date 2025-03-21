import 'package:flutter/material.dart';
import 'database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF121C2D), // Dark background
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasks = await _dbHelper.getTasks();
    setState(() => _tasks = tasks);
  }

  Future<void> _addTask() async {
    if (_controller.text.isNotEmpty) {
      await _dbHelper.addTask(_controller.text);
      _controller.clear();
      await _loadTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'TODO APP',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter a new task',
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: _addTask,
                ),
              ),
            ),
          ),
          Expanded(
            child: _tasks.isEmpty
                ? const Center(
                    child: Text(
                      'No tasks added yet!',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          _tasks[index]['title'],
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
