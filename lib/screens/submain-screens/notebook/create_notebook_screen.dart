import 'package:flutter/material.dart';

class CreateNotebookScreen extends StatefulWidget {
  static const routeName = '/create-notebook-screen';
  const CreateNotebookScreen({super.key});

  @override
  State<CreateNotebookScreen> createState() => _CreateNotebookScreenState();
}

class _CreateNotebookScreenState extends State<CreateNotebookScreen> {
  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _tagController = TextEditingController();

    
    void _addNotebook() {
      print(_nameController.text);
      print(_descriptionController.text);
      print(_tagController.text);
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
                onPressed: _addNotebook, child: const Text("Add Journal"))
          ],
        ),
      ),
    );
  }
}
