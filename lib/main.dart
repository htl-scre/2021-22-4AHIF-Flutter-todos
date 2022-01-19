import 'package:flutter/material.dart';

import 'domain/todo.dart';
import 'widgets/todo_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      title: 'Todos',
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todos = [
    Todo('DGL lösen'),
    Todo('Kochen'),
    Todo('Schlafen'),
    Todo('Einkaufen'),
    Todo('Duschen'),
  ];

  void submitNewTodo(String input) {
    setState(() {
      todos.add(new Todo(input));
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (_, index) {
          return TodoItem(todos[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                height: 350,
                child: TextField(
                  autofocus: true,
                  onSubmitted: submitNewTodo,
                ),
              );
            },
          );
        },
      ),
    );
  }
}