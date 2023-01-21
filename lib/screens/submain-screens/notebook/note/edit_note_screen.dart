import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:drift/drift.dart' as drift;
import 'package:mytica/screens/submain-screens/notebook/note/note_screen.dart';

class Edit_NoteScreen extends StatefulWidget {
  const Edit_NoteScreen({super.key});

  static const routeName = '/detail-note-screen';

  @override
  State<Edit_NoteScreen> createState() => _Edit_NoteScreenState();
}

class _Edit_NoteScreenState extends State<Edit_NoteScreen> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagController = TextEditingController();

  void _update() async {
    final note = ModalRoute.of(context)?.settings.arguments as Note;
    // final notebook = args as Notebook;
    final title = _titleController.text;
    final body = _descriptionController.text;
    final tag = _tagController.text;

    if (title.isNotEmpty && body.isNotEmpty && tag.isNotEmpty) {
      final noteEntity = NotesCompanion(
          id: drift.Value(note.id),
          title: drift.Value(title),
          body: drift.Value(body),
          tag: drift.Value(tag),
          userId: drift.Value(note.userId),
          notebookId: drift.Value(note.notebookId),
          createdAt: drift.Value(note.createdAt));
      print("Companion Obj created ************************");
      print(noteEntity);
      bool isUpdated = await _db.updateNote(noteEntity);
      print("updated Obj created ************************");
      if (isUpdated) {
        print("Note updated $isUpdated");
        await _db.close();
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(
          NoteScreen.routeName,
          arguments: note.notebookId,
        );
      } else {
        showNotebookNotAddedDialogBox(context);
      }
    } else {
      showFieldCannotBeEmptyDialogBox(context);
    }
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

  void showFieldCannotBeEmptyDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Fields Empty!"),
        content: const Text("Fields cannot be empty."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(14),
              child: const Text("Okay"),
            ),
          ),
        ],
      ),
    );
  }

  void showNotebookNotAddedDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Failed"),
        content: const Text("Notebook Not Added. Please try again later."),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(14),
              child: const Text("Okay"),
            ),
          ),
        ],
      ),
    );
  }
}
