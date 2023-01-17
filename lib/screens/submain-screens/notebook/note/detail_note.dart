import 'package:flutter/material.dart';
import 'package:mytica/models/Notebook/Note.dart';

class DetailNoteScreen extends StatelessWidget {
  const DetailNoteScreen({super.key});

  static const routeName = '/detail-note-screen';

  @override
  Widget build(BuildContext context) {
    final note = ModalRoute.of(context)?.settings.arguments as Note;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          width: 500,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: note.title,
                  decoration: InputDecoration(
                    label: Text("Title"),
                  ),
                ),
                TextFormField(
                  initialValue: note.body,
                  decoration: InputDecoration(
                    label: Text("Description"),
                  ),
                ),
                TextFormField(
                  initialValue: note.tag,
                  decoration: InputDecoration(
                    label: Text("Tag"),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    print("update the note...");
                  },
                  child: Text("Update"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
