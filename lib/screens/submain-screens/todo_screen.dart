import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  static const String routeName = '/todo-screen';
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-do"),
      ),
      body: Center(child: Text("Todo Screen")),
    );
  }
}
