import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:mytica/screens/submain-screens/notebook/note/create_note.dart';
import 'package:mytica/screens/submain-screens/notebook/note/detail_note_screen.dart';
import 'package:mytica/widgets/Items/note_item.dart';

class NoteScreen extends StatefulWidget {
  static const routeName = '/note-screen';
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late AppDb _db;

  @override
  Widget build(BuildContext context) {
    _db = AppDb();
    final notebookId = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Notes")),
        actions: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Row(
                  children: [
                    TextButton(
                      child: const Text(
                        "Log out",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        print("Log out ");
                      },
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(Icons.logout_rounded),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              )),
        ],
      ),
      body: FutureBuilder<List<Note>>(
        future: _db.getNoteByNotebookId(notebookId),
        builder: ((context, snapshot) {
          final List<Note>? notes = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (notes != null) {
            _db.close();
            return Container(
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
            );
          }
          return const Center(
            child: Text("0 entires found"),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _db.close();
          Navigator.of(context)
              .pushNamed(CreateNoteScreen.routeName, arguments: notebookId)
              .then((value) => setState(() {}));
          ;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
