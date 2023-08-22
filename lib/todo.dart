import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

final todos =
List.generate(20, (index) => Todo('TODO $index', 'description of $index'));

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (content, index) {
            return ListTile(title: Text(todos[index].title),);
          },
    ),
    );
  }
}
