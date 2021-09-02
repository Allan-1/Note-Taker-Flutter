import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/models/todo.dart';
import 'package:intl/intl.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  const TodoList(this.todos);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: todos.length > 0
            ? Column(
                children: [
                  ...todos.map((todo) {
                    return Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                        width: double.infinity,
                        child: Card(
                          elevation: 6,
                          child: Padding(
                              padding: EdgeInsets.all(7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Text(
                                    todo.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                    ),
                                  )),
                                  Text(
                                    '${todo.items}',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Date created: ${DateFormat.yMMMd().format(todo.date)}',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              )),
                        ));
                  }).toList()
                ],
              )
            : Center(
                heightFactor: 20,
                child: Text(
                  'Press the + button to add Todo',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )));
  }
}
