import 'package:flutter/material.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({super.key});

  static const routeName = '/create-note-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("create note screen"),
      ),
    );
  }
}
