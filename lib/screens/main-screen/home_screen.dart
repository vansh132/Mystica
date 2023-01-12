import 'package:flutter/material.dart';
import 'package:mytica/screens/submain-screens/album/album_screen.dart';
import 'package:mytica/screens/submain-screens/journal_screen.dart';
import 'package:mytica/screens/submain-screens/notebook_screen.dart';
import 'package:mytica/screens/submain-screens/reminder_screen.dart';
import 'package:mytica/screens/submain-screens/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //Dashboard
            Container(
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Card(
                child: Text(
                  "dashboard",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            //options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(JournalScreen.routeName);
                  },
                  child: Card(
                    elevation: 7,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.red,
                            Colors.redAccent
                          ], //final - 1
                              stops: [
                            0.4,
                            0.7
                          ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      height: 100,
                      width: 175,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.search),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Journal"),
                                Icon(Icons.arrow_forward_rounded)
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(NotebookScreen.routeName);
                  },
                  child: Card(
                    elevation: 7,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.green,
                            Colors.greenAccent
                          ], //final - 1
                              stops: [
                            0.4,
                            0.7
                          ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      height: 100,
                      width: 175,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.search),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Notebook"),
                                Icon(Icons.arrow_forward_rounded)
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(TodoScreen.routeName);
                  },
                  child: Card(
                    elevation: 16,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.red,
                            Colors.redAccent
                          ], //final - 1
                              stops: [
                            0.4,
                            0.7
                          ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      height: 100,
                      width: 175,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.search),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("To-Do"),
                                Icon(Icons.arrow_forward_rounded)
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(ReminderScreen.routeName);
                  },
                  child: Card(
                    elevation: 7,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.green,
                            Colors.greenAccent
                          ], //final - 1
                              stops: [
                            0.4,
                            0.7
                          ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      height: 100,
                      width: 175,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.search),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Reminder"),
                                Icon(Icons.arrow_forward_rounded)
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(AlbumScreen.routeName);
                  },
                  child: Card(
                    elevation: 7,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.red,
                            Colors.redAccent
                          ], //final - 1
                              stops: [
                            0.4,
                            0.7
                          ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      height: 100,
                      width: 175,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.search),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text("Gallery"),
                                Icon(Icons.arrow_forward_rounded)
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //section 1

            //section 2
          ],
        ),
      ),
    );
  }
}
