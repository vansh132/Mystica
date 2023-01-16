import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  static const routeName = '/note-screen';
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notebookId = ModalRoute.of(context)?.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
              stops: [0.4, 0.7],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8255,
              color: Colors.red,
            ),
            const VerticalDivider(
              width: 4,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
