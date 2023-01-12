import 'package:flutter/material.dart';

class EditJournalScreen extends StatelessWidget {
  static const routeName = "/edit-journal-screen";
  const EditJournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final journalId = ModalRoute.of(context)?.settings.arguments as String;
    //To-Do: Retrieve journal data
    print(journalId);
    //To-Do: Update journal data
    void _updateData() {}
    //To-Do (Vansh): Set initial values to fields
    final journalTitle = 'Goa trip';
    final journalDescription = 'Final semester trip with juniors';
    final journalTag = '#presidency';

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
                      decoration: InputDecoration(label: Text("Title")),
                      initialValue: journalTitle,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      initialValue: journalDescription,
                      decoration: InputDecoration(label: Text("Description")),
                      maxLines: 4,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      initialValue: journalTag,
                      decoration: InputDecoration(label: Text("Tag")),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    IconButton(onPressed: _updateData, icon: Icon(Icons.save))
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
