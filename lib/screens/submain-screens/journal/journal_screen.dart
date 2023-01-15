import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:mytica/screens/submain-screens/journal/create_journal_screen.dart';
import 'package:mytica/widgets/Items/journal_item.dart';
import 'package:mytica/widgets/navigation.dart';

class JournalScreen extends StatefulWidget {
  static const String routeName = '/journal-screen';
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  late AppDb _db;

  @override
  void initState() {
    super.initState();
    /*  final data = [
      _ChartData('David', 25),
      _ChartData('Steve', 38),
      _ChartData('Jack', 34),
      _ChartData('Others', 52)
    ]; */
    // _db = AppDb();
  }

  // @override
  // void dispose() {
  //   _db.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    _db = AppDb();
    //To-do: Retrieve journals from database and convert it into List<Journal>.
    // List<Journal> journals = [
    //   Journal(
    //     id: "Jid",
    //     title: "Mid term",
    //     description:
    //         "I have worked hard and i got the desired results in mid term exams in fifth semester",
    //     tag: "#presidency",
    //     createdAt: DateTime.now(),
    //   ),
    //   Journal(
    //     id: "Jid",
    //     title: "Mid term",
    //     description:
    //         "I have worked hard and i got the desired results in mid term exams in fifth semester",
    //     tag: "#presidencyThings",
    //     createdAt: DateTime.now(),
    //   ),
    //   Journal(
    //     id: "Jid",
    //     title: "Mid term",
    //     description:
    //         "I have worked hard and i got the desired results in mid term exams in fifth semester",
    //     tag: "#presidencyThings",
    //     createdAt: DateTime.now(),
    //   ),
    //   Journal(
    //     id: "Jid",
    //     title: "Mid term",
    //     description:
    //         "I have worked hard and i got the desired results in mid term exams in fifth semester",
    //     tag: "#presidencyThings",
    //     createdAt: DateTime.now(),
    //   ),
    //   Journal(
    //     id: "Jid",
    //     title: "Mid term",
    //     description:
    //         "I have worked hard and i got the desired results in mid term exams in fifth semester",
    //     tag: "#presidencyThings",
    //     createdAt: DateTime.now(),
    //   ),
    // ];

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Journal")),
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
      body: FutureBuilder<List<Journal>>(
        future: _db.getJournals(),
        builder: ((context, snapshot) {
          final List<Journal>? journals = snapshot.data;
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (journals != null) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xffADD8FF),
                Color(0xffEBF5FF)
              ], //final - 1
                      stops: [
                    0.4,
                    0.7
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Row(
                children: [
                  Container(
                    color: const Color(0xff001427),
                    width: MediaQuery.of(context).size.width * 0.12,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Quote of the Day",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xffCAF0F8)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "\" Life is either a daring adventure or nothing at all \"",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color(0xffedf6f9)),
                          textAlign: TextAlign.center,
                        ),
                        NavigationRow()
                      ],
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 4.5 / 3,
                              crossAxisSpacing: 40,
                              mainAxisSpacing: 35),
                      itemBuilder: (context, index) =>
                          JournalItem(journals[index]),
                    ),
                  ),
                  const VerticalDivider(
                    width: 4,
                    color: Colors.grey,
                  ),
                  Container(
                    // color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width * 0.1745,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          "Journal Overview:",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Journal count: ${journals.length}",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: Text("0 entires found"),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _db.close();
          Navigator.of(context)
              .pushNamed(CreateJournalScreen.routeName)
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
