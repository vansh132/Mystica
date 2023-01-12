import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:drift/drift.dart' as drift;

class EditJournalScreen extends StatefulWidget {
  static const routeName = "/edit-journal-screen";
  const EditJournalScreen({super.key});

  @override
  State<EditJournalScreen> createState() => _EditJournalScreenState();
}

class _EditJournalScreenState extends State<EditJournalScreen> {
  final _journalTitleController = TextEditingController();
  final _journalDescriptionController = TextEditingController();
  final _journalTagController = TextEditingController();

  late AppDb _db;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  Widget build(BuildContext context) {
    final journal = ModalRoute.of(context)?.settings.arguments as Journal;
    print("Journal value");
    print(journal);
    _journalTitleController.text = journal.title;
    _journalDescriptionController.text = journal.body;
    _journalTagController.text = journal.tag;

    //To-Do: Retrieve journal data
    print("Journal id (edit screen)- ${journal.id}");

    //To-Do: Update journal data
    void _updateData() async {
      final journalEntity = JournalsCompanion(
          id: drift.Value(journal.id),
          title: drift.Value(_journalTitleController.text),
          body: drift.Value(_journalDescriptionController.text),
          tag: drift.Value(_journalTagController.text),
          createdAt: drift.Value(journal.createdAt));

      bool isUpdated = await _db.updateJournal(journalEntity);
      if (isUpdated) {
        print("Journal Added $isUpdated");
        _db.close();
        Navigator.of(context).pop();
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Failed"),
            content: const Text("Journal Not Added. Please try again later."),
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit journal"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
                stops: [0.4, 0.7],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        // color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 500,
              padding: const EdgeInsets.all(16),
              // color: Colors.red,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: const LinearGradient(colors: [
                    Color(0xffEBF5FF),
                    Color(0xffADD8FF)
                  ], //final - 1
                      stops: [
                        0.4,
                        0.7
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _journalTitleController,
                      decoration: const InputDecoration(label: Text("Title")),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _journalDescriptionController,
                      decoration:
                          const InputDecoration(label: Text("Description")),
                      maxLines: 4,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: _journalTagController,
                      decoration: const InputDecoration(label: Text("Tag")),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    IconButton(
                        onPressed: _updateData, icon: const Icon(Icons.save))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
