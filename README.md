# To-Do List App (Flutter)

A simple Flutter To-Do List application built with SQLite db to help you manage your daily tasks.

---

## Project Structure

lib/
├── main.dart               # UI logic & entry point
├── database_helper.dart    # SQLite logic
test/
├── database_helper_test.dart  # Unit tests

---

## Features

- Add new tasks
- Display tasks in a list
- Delete tasks individually 
- Clear all tasks at once 
- Tasks are saved using local SQLite db (persists after closing app)

---

## Project Goals

This app was built as part of a MoneyMatch Interview: Case Assessment. The goal was to:
- Build a working Flutter application with state management
- Use local database integration (SQLite)
- Implement simple UI and basic functionality
- Write clean and testable code
- Maintain clear Git commit history

The App should be able to do following functionalities:
• Read all items from database
• Create new item to database
• Update one item
• Delete one item
• Delete all items

---
## File Structure

Front end: main.dart
Back end: database_helper.dart
Test: database_helper_test.dart

## Tech Stack

- Flutter
- Dart
- SQLite (via `sqflite` and `path_provider`)
- State management using `setState`
- Unit testing with `flutter_test` + `sqflite_common_ffi`

---

Developed by:

- [@NabeelByte](https://github.com/NabeelByte/todo_app_testing)
