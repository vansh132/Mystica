import 'package:flutter/material.dart';
import 'package:mytica/models/Notebook/Note.dart';

class Edit_NoteScreen extends StatefulWidget {
  const Edit_NoteScreen({super.key});

  static const routeName = '/detail-note-screen';

  @override
  State<Edit_NoteScreen> createState() => _Edit_NoteScreenState();
}

class _Edit_NoteScreenState extends State<Edit_NoteScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagController = TextEditingController();

  void _update() {
    print("---update note---");
    print(_titleController.text);
    print(_tagController.text);
    print(_descriptionController.text);
  }

  @override
  Widget build(BuildContext context) {
    final note = ModalRoute.of(context)?.settings.arguments as Note;
    _titleController.text = note.title;
    _tagController.text = note.tag;
    _descriptionController.text = note.body;
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
                  controller: _titleController,
                  decoration: InputDecoration(
                    label: Text("Title"),
                  ),
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    label: Text("Description"),
                  ),
                ),
                TextFormField(
                  controller: _tagController,
                  decoration: InputDecoration(
                    label: Text("Tag"),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: _update,
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
