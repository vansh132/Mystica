import 'package:flutter/material.dart';
import 'package:mytica/models/Notebook/Note.dart';
import 'package:mytica/screens/submain-screens/notebook/note/create_note.dart';
import 'package:mytica/screens/submain-screens/notebook/note/edit_note_screen.dart';
import 'package:mytica/widgets/Items/note_item.dart';

class NoteScreen extends StatefulWidget {
  static const routeName = '/note-screen';
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    final notebookId = ModalRoute.of(context)?.settings.arguments as int;

    final notes = [
      Note(
        notebookId: 1,
        id: 11,
        title: "title",
        body: "body",
        tag: "#tag",
        createdAt: DateTime.now(),
      ),
      Note(
        notebookId: 1,
        id: 11,
        title: "title",
        body: "body",
        tag: "#tag",
        createdAt: DateTime.now(),
      ),
      Note(
        notebookId: 1,
        id: 11,
        title: "title",
        body: "body",
        tag: "#tag",
        createdAt: DateTime.now(),
      ),
      Note(
        notebookId: 1,
        id: 11,
        title: "title",
        body: "body",
        tag: "#tag",
        createdAt: DateTime.now(),
      ),
      Note(
        notebookId: 1,
        id: 11,
        title: "title",
        body: "body",
        tag: "#tag",
        createdAt: DateTime.now(),
      ),
    ];

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
              padding: const EdgeInsets.all(32),
              width: MediaQuery.of(context).size.width * 0.8255,
              child: GridView.builder(
                itemCount: notes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 2,
                    crossAxisSpacing: 45,
                    mainAxisSpacing: 35),
                itemBuilder: (context, index) => NoteItem(notes[index]),
              ),
            ),
            const VerticalDivider(
              width: 4,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CreateNoteScreen.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
