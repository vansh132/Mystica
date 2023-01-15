import 'package:flutter/material.dart';
import 'package:mytica/models/todo/todo.dart';

class todo_item extends StatelessWidget {
  TODO todoList;

  todo_item(this.todoList);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      margin: EdgeInsets.all(8),
      height: 100,
      width: 200,
      child: Text(todoList.title),
    );
  }
}
