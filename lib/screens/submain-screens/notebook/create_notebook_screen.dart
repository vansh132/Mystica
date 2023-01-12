import 'package:flutter/material.dart';

class CreateNotebookScreen extends StatelessWidget {
  static const routeName = '/create-notebook-screen';
  const CreateNotebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Create Notebook screen"),
      ),
    );
  }
}
