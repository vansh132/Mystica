import 'package:flutter/material.dart';
import 'package:mytica/models/Notebook/Note.dart';
import 'package:intl/intl.dart';
import 'package:mytica/screens/submain-screens/notebook/note/detail_note.dart';
import 'package:mytica/screens/submain-screens/notebook/note/edit_note_screen.dart';

class NoteItem extends StatefulWidget {
  Note note;

  NoteItem(this.note);

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  //To-Do: Update the note
  void _updateNote() {
    Navigator.of(context).pushNamed(DetailNoteScreen.routeName);
  }

  //To-Do: delele the note
  void _deleteNote() {
    print("Delete the notes...");
  }

  @override
  Widget build(BuildContext context) {
    int? selectedOption;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(DetailNoteScreen.routeName, arguments: widget.note);
      },
      child: Container(
        margin: const EdgeInsets.all(6.0),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      widget.note.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                PopupMenuButton<int>(
                  elevation: 7,
                  icon: Icon(Icons.menu_rounded),
                  initialValue: selectedOption,
                  onSelected: (newSelectedOption) {
                    setState(() {
                      selectedOption = newSelectedOption;
                      switch (selectedOption) {
                        case 0:
                          _updateNote();
                          break;
                        case 1:
                          _deleteNote();
                          break;
                      }
                    });
                  },
                  itemBuilder: (context) => <PopupMenuEntry<int>>[
                    PopupMenuItem(
                      value: 0,
                      child: Text("Edit"),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Text("Delete"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              height: 4,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              widget.note.body,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    height: 2,
                    color: Colors.transparent,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.note.tag,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd().format(
                          widget.note.createdAt,
                        ),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
