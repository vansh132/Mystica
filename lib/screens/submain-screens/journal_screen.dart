import 'package:flutter/material.dart';
import 'package:mytica/models/Journal/Journal.dart';
import 'package:mytica/widgets/Items/journal_item.dart';
import 'package:mytica/widgets/Items/new_journal.dart';
import 'package:mytica/widgets/navigation.dart';

class JournalScreen extends StatelessWidget {
  static const String routeName = '/journal-screen';
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //To-do: Retrieve journals from database and convert it into List<Journal>.
    List<Journal> journals = [
      Journal(
        id: "Jid",
        title: "Mid term",
        description:
            "I have worked hard and i got the desired results in mid term exams in fifth semester",
        tag: "#presidency",
        createdAt: DateTime.now(),
      ),
      Journal(
        id: "Jid",
        title: "Mid term",
        description:
            "I have worked hard and i got the desired results in mid term exams in fifth semester",
        tag: "#presidencyThings",
        createdAt: DateTime.now(),
      ),
      Journal(
        id: "Jid",
        title: "Mid term",
        description:
            "I have worked hard and i got the desired results in mid term exams in fifth semester",
        tag: "#presidencyThings",
        createdAt: DateTime.now(),
      ),
      Journal(
        id: "Jid",
        title: "Mid term",
        description:
            "I have worked hard and i got the desired results in mid term exams in fifth semester",
        tag: "#presidencyThings",
        createdAt: DateTime.now(),
      ),
      Journal(
        id: "Jid",
        title: "Mid term",
        description:
            "I have worked hard and i got the desired results in mid term exams in fifth semester",
        tag: "#presidencyThings",
        createdAt: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Journal"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffADD8FF), Color(0xffEBF5FF)], //final - 1
                stops: [0.4, 0.7],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.12,
              child: Column(
                children: const [NavigationRow()],
              ),
            ),
            const VerticalDivider(
              width: 4,
              color: Colors.grey,
            ),
            Container(
              padding: const EdgeInsets.all(32),
              width: MediaQuery.of(context).size.width * 0.7,
              child: GridView.builder(
                itemCount: journals.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 7 / 3,
                    crossAxisSpacing: 55,
                    mainAxisSpacing: 35),
                itemBuilder: (context, index) => JournalItem(journals[index]),
              ),
            ),
            const VerticalDivider(
              width: 4,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: const NewJournal(),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
