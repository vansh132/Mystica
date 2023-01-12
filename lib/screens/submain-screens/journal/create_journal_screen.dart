import 'package:flutter/material.dart';

class CreateJournalScreen extends StatefulWidget {
  static const routeName = "/create-journal-screen";
  const CreateJournalScreen({super.key});

  @override
  State<CreateJournalScreen> createState() => _CreateJournalScreenState();
}

class _CreateJournalScreenState extends State<CreateJournalScreen> {
  @override
  Widget build(BuildContext context) {
    final _journalTitleController = TextEditingController();
    final _journalDescriptionController = TextEditingController();
    final _journalTagController = TextEditingController();

    void _addJournal() {
      final enteredJournalTitle = _journalTitleController.text;
      final enteredJournalDescription = _journalDescriptionController.text;
      final enteredJournalTag = _journalTagController.text;

      if (enteredJournalTitle.isEmpty ||
          enteredJournalDescription.length < 10) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "Minimum 10 characters of description",
          ),
          duration: Duration(seconds: 4),
        ));
        // Navigator.of(context).pushReplacementNamed(AlbumScreen.routeName);
      }

      //To-do: database
      print(enteredJournalTitle);
      print(enteredJournalDescription);
      print(enteredJournalTag);

      // Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.only(
              top: 10,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                controller: _journalTitleController,
                onSubmitted: (_) => _addJournal(),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 4,
                controller: _journalDescriptionController,
                onSubmitted: (_) => _addJournal(),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Tag'),
                controller: _journalTagController,
                onSubmitted: (_) => _addJournal(),
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: _addJournal, child: const Text("Add Journal"))
            ],
          ))),
    );
  }
}
