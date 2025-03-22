import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:todo_app_testing/database_helper.dart';

void main() {
  // Init SQLite FFI
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final dbHelper = DatabaseHelper();

  setUp(() async {
    await dbHelper.deleteAllTasks(); // Clean DB before each test
  });

  test('Add a task to the database', () async {
    await dbHelper.addTask('Test Task');
    final tasks = await dbHelper.getTasks();

    expect(tasks.length, 1);
    expect(tasks.first['title'], 'Test Task');
  });

  test('Delete a task by ID', () async {
    await dbHelper.addTask('Delete Me');
    final tasks = await dbHelper.getTasks();
    final id = tasks.first['id'];

    await dbHelper.deleteTaskById(id);
    final updatedTasks = await dbHelper.getTasks();

    expect(updatedTasks.isEmpty, true);
  });

  test('Delete all tasks', () async {
    await dbHelper.addTask('A');
    await dbHelper.addTask('B');
    await dbHelper.deleteAllTasks();

    final tasks = await dbHelper.getTasks();
    expect(tasks.length, 0);
  });
}
