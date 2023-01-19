import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';

class EditNotebookScreen extends StatefulWidget {
  const EditNotebookScreen({super.key});

  static const routeName = 'edit-notebook-screen';
  @override
  State<EditNotebookScreen> createState() => _EditNotebookScreenState();
}

class _EditNotebookScreenState extends State<EditNotebookScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagController = TextEditingController();

  void _updateNotebook() {
    print("Notebook updated...");
  }

  @override
  Widget build(BuildContext context) {
    final notebook = ModalRoute.of(context)?.settings.arguments as Notebook;
    print("Notebook - ${notebook}");

    _nameController.text = notebook.name;
    _descriptionController.text = notebook.description;
    _tagController.text = notebook.tag;

    return Scaffold(
      appBar: AppBar(),
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
