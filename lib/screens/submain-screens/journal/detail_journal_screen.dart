import 'package:flutter/material.dart';
import 'package:mytica/data/local/db/app_db.dart';
import 'package:intl/intl.dart';

class DetailJournalScreen extends StatefulWidget {
  static const routeName = "/detail-journal-screen";
  const DetailJournalScreen({super.key});

  @override
  State<DetailJournalScreen> createState() => _DetailJournalScreenState();
}

class _DetailJournalScreenState extends State<DetailJournalScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List<Object>;
    final journal = args[0] as Journal;
    final journalColor = args[1] as Color;
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: journalColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.all(32),
                  padding: const EdgeInsets.all(16),
                  // color: Colors.red,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    children: [
                      Text(
                        journal.title,
                        style: const TextStyle(fontSize: 56),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        journal.body,
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Divider(
                        height: 2,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            journal.tag,
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                          Row(
                            children: [
                              Text(
                                DateFormat('yyyy-MM-dd')
                                    .format(journal.createdAt),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                DateFormat.Hms().format(journal.createdAt),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
