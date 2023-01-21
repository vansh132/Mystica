import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:drift/drift.dart' as drift;
import 'package:mytica/screens/submain-screens/notebook/notebook_screen.dart';

class EditNotebookScreen extends StatefulWidget {
  // Notebook notebook;
  // EditNotebookScreen(this.notebook);
  static const routeName = 'edit-notebook-screen';

  const EditNotebookScreen({super.key});
  @override
  State<EditNotebookScreen> createState() => _EditNotebookScreenState();
}

class _EditNotebookScreenState extends State<EditNotebookScreen> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagController = TextEditingController();

  void _updateNotebook() async {
    final notebook = ModalRoute.of(context)?.settings.arguments as Notebook;
    // final notebook = args as Notebook;
    final name = _nameController.text;
    final description = _descriptionController.text;
    final tag = _tagController.text;

    if (name.isNotEmpty && description.isNotEmpty && tag.isNotEmpty) {
      final notebookEntity = NotebooksCompanion(
          id: drift.Value(notebook.id),
          name: drift.Value(name),
          description: drift.Value(description),
          tag: drift.Value(tag),
          createdAt: drift.Value(notebook.createdAt),
          userId: drift.Value(notebook.userId));

      bool isUpdated = await _db.updateNotebook(notebookEntity);
      if (isUpdated) {
        print("Notebook Edited $isUpdated");
        await _db.close();
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(NotebookScreen.routeName);
      } else {
        showNotebookNotUpdatedDialogBox();
      }
    } else {
      showFieldCannotBeEmptyDialogBox();
    }
  }

  void showFieldCannotBeEmptyDialogBox() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Failed"),
        content: const Text("Notebook Not Updated. Please try again later."),
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

  void showNotebookNotUpdatedDialogBox() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Failed"),
        content: const Text("Notebook Not Updated. Please try again later."),
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

  @override
  Widget build(BuildContext context) {
    final notebook = ModalRoute.of(context)?.settings.arguments as Notebook;
    print("Notebook - ${notebook}");

    _nameController.text = notebook.name;
    _descriptionController.text = notebook.description;
    _tagController.text = notebook.tag;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Edit Notebook")),
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
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
                stops: [0.4, 0.7],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height,
                // color: Colors.yellow,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    padding: EdgeInsets.only(
                        top: 10,
                        left: 20,
                        right: 20,
                        bottom: MediaQuery.of(context).viewInsets.bottom + 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(labelText: 'Name'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _descriptionController,
                          decoration:
                              const InputDecoration(labelText: 'Description'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _tagController,
                          decoration: const InputDecoration(labelText: 'Tag'),
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        ElevatedButton(
                            onPressed: _updateNotebook,
                            child: const Text("Update Notebook"))
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}
