import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytica/data/local/db/app_db.dart';

class DetailNoteScreen extends StatefulWidget {
  const DetailNoteScreen({super.key});

  static const routeName = '/edit-note-screen';

  @override
  State<DetailNoteScreen> createState() => _DetailNoteScreenState();
}

class _DetailNoteScreenState extends State<DetailNoteScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as List<Object>;
    final note = arguments[0] as Note;
    final color = arguments[1] as Color;
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Detail Note")),
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: color,
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
                        note.title,
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
                        note.body,
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
                            note.tag,
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                          Row(
                            children: [
                              Text(
                                DateFormat('yyyy-MM-dd').format(note.createdAt),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                DateFormat.Hms().format(note.createdAt),
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
