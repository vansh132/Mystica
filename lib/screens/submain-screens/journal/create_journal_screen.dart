import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:drift/drift.dart' as drift;
import 'package:shared_preferences/shared_preferences.dart';

class CreateJournalScreen extends StatefulWidget {
  static const routeName = "/create-journal-screen";
  const CreateJournalScreen({super.key});

  @override
  State<CreateJournalScreen> createState() => _CreateJournalScreenState();
}

class _CreateJournalScreenState extends State<CreateJournalScreen> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();
    _db = AppDb();
  }

  @override
  Widget build(BuildContext context) {
    final _journalTitleController = TextEditingController();
    final _journalDescriptionController = TextEditingController();
    final _journalTagController = TextEditingController();

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

    void _addJournal() async {
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

      final journalEntity = JournalsCompanion(
          title: drift.Value(enteredJournalTitle),
          body: drift.Value(enteredJournalDescription),
          tag: drift.Value(enteredJournalTag),
          userId: drift.Value(userId),
          createdAt: drift.Value(DateTime.now()));

      int res = await _db.insertJournal(journalEntity);
      if (res != 0) {
        print("Journal Added $res");
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
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 550,
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  controller: _journalTitleController,
                  onSubmitted: (_) => _addJournal(),
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
                  controller: _journalDescriptionController,
                  onSubmitted: (_) => _addJournal(),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 550,
                child: TextField(
                  decoration: const InputDecoration(labelText: 'Tag'),
                  controller: _journalTagController,
                  onSubmitted: (_) => _addJournal(),
                ),
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
