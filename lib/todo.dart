import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sandbox/todo_detail.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (content, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    // MaterialPageRoute(builder: (context) => DetailScreen(todo: todos[index]))
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(),
                        settings: RouteSettings(
                          arguments: todos[index]
                        )
                    )
                );
              },
            );
          },
    ),
    );
  }
}
