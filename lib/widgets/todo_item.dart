import 'package:flutter/material.dart';
import 'package:todo_list/domain/todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todo;

  const TodoItem(this.todo, {Key? key}) : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            CircleAvatar(
              child: IconButton(
                onPressed: () {
                  setState(() => widget.todo.done = !widget.todo.done);
                },
                icon: Icon(Icons.check),
              ),
            ),
            SizedBox(width: 10),
            Text(
              widget.todo.description,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                decoration: widget.todo.done ? TextDecoration.lineThrough : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}