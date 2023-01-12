import 'package:flutter/material.dart';

class NotebookScreen extends StatelessWidget {
  static const String routeName = '/notebook-screen';
  const NotebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notebook"),
      ),
      body: Center(child: Text("Notebook Screen")),
    );
  }
}
