import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drift/drift.dart' as drift;

class CreateNotebookScreen extends StatefulWidget {
  static const routeName = '/create-notebook-screen';
  const CreateNotebookScreen({super.key});

  @override
  State<CreateNotebookScreen> createState() => _CreateNotebookScreenState();
}

class _CreateNotebookScreenState extends State<CreateNotebookScreen> {
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
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _tagController = TextEditingController();

    void _addNotebook() async {
      final name = _nameController.text;
      final description = _descriptionController.text;
      final tag = _tagController.text;

      if (name.isNotEmpty && description.isNotEmpty && tag.isNotEmpty) {
        final notebookEntity = NotebooksCompanion(
            name: drift.Value(name),
            description: drift.Value(description),
            tag: drift.Value(tag),
            createdAt: drift.Value(DateTime.now()),
            userId: drift.Value(userId));

        int res = await _db.insertNotebook(notebookEntity);
        if (res != 0) {
          print("Notebook Added $res");
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
                onSubmitted: (_) => _addNotebook(),
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
                onSubmitted: (_) => _addNotebook(),
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
                onSubmitted: (_) => _addNotebook(),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
                onPressed: _addNotebook, child: const Text("Add Notebook"))
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
