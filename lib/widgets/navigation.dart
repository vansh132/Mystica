import 'package:flutter/material.dart';
import 'package:mytica/screens/submain-screens/album/album_screen.dart';
import 'package:mytica/screens/submain-screens/journal/journal_screen.dart';
import 'package:mytica/screens/submain-screens/notebook/notebook_screen.dart';
import 'package:mytica/screens/submain-screens/reminder_screen.dart';
import 'package:mytica/screens/submain-screens/todo_screen.dart';

class NavigationRow extends StatelessWidget {
  const NavigationRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(JournalScreen.routeName);
              },
              child: Text(
                "Journal",
                style: TextStyle(fontSize: 22),
              )),
          Divider(
            height: 16,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(NotebookScreen.routeName);
              },
              child: Text(
                "Notebooks",
                style: TextStyle(fontSize: 22),
              )),
          Divider(
            height: 16,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(AlbumScreen.routeName);
              },
              child: Text(
                "Album",
                style: TextStyle(fontSize: 22),
              )),
          Divider(
            height: 16,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(ReminderScreen.routeName);
              },
              child: Text(
                "Reminder",
                style: TextStyle(fontSize: 22),
              )),
          Divider(
            height: 16,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(TodoScreen.routeName);
              },
              child: Text(
                "To - do",
                style: TextStyle(fontSize: 22),
              )),
          Divider(
            height: 16,
          ),
        ],
      ),
    );
  }
}
