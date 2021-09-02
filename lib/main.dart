import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/todoInput.dart';
import 'package:todo/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Todo> _todo = [];

  void _addTodo(String title, String item) {
    final newTodo = Todo(
        id: DateTime.now().toString(),
        date: DateTime.now(),
        items: item,
        title: title);
    setState(() {
      _todo.add(newTodo);
    });
  }

  void _startNewTodo(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return TodoInput(_addTodo);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _startNewTodo(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        width: double.infinity,
        child: Column(
          children: [
            TodoList(_todo),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startNewTodo(context);
        },
      ),
    );
  }
}
