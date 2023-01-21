import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/drift.dart' as drift;

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  static const routeName = '/create-note-screen';

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  late AppDb _db;

  int userId = 0;

  void getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final int? id = prefs.getInt('userId');
    if (id != null) {
      userId = id;
    }
  }

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _db = AppDb();
    final notebookId = ModalRoute.of(context)?.settings.arguments as int;
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _tagController = TextEditingController();

    void _addNote() async {
      final title = _nameController.text;
      final body = _descriptionController.text;
      final tag = _tagController.text;

      if (title.isNotEmpty && body.isNotEmpty && tag.isNotEmpty) {
        final noteEntity = NotesCompanion(
            title: drift.Value(title),
            body: drift.Value(body),
            tag: drift.Value(tag),
            createdAt: drift.Value(DateTime.now()),
            notebookId: drift.Value(notebookId),
            userId: drift.Value(userId));

        int res = await _db.insertNote(noteEntity);
        if (res != 0) {
          print("Note Added $res");
          await _db.close();
          Navigator.of(context).pop();
        } else {
          showNotebookNotAddedDialogBox(context);
        }
      } else {
        showFieldCannotBeEmptyDialogBox(context);
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              // colors: [Color(0xff8EC5FC), Color(0xffE0C3FC)], //final - 1
              colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
              stops: [0.4, 0.7],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 550,
              child: TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: _nameController,
                onSubmitted: (_) => _addNote(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 550,
              child: TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 4,
                controller: _descriptionController,
                onSubmitted: (_) => _addNote(),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 550,
              child: TextField(
                decoration: const InputDecoration(labelText: 'Tag'),
                controller: _tagController,
                onSubmitted: (_) => _addNote(),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: _addNote,
              child: const Text("Add Note"),
            )
          ],
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
