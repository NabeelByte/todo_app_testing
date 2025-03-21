import 'package:flutter/material.dart';
 
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
             fontFamily: 'Poppins', // Ensure the fot is added
             fontSize: 18,
             color: Colors.white, // White text
             fontWeight: FontWeight.w400,
           ),
           titleLarge: TextStyle(
             fontFamily: 'Poppins',
             fontSize: 24,
             fontWeight: FontWeight.bold,
             color: Colors.white, // White text
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
  final TextEditingController _controller = TextEditingController();
  List<String> _tasks = [];

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text);
      });
      _controller.clear();
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
          // Text Input
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

          // Task List
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
                          _tasks[index],
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
