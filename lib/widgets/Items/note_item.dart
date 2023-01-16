import 'package:flutter/material.dart';
import 'package:mytica/models/Notebook/Note.dart';
import 'package:intl/intl.dart';

class NoteItem extends StatefulWidget {
  Note note;

  NoteItem(this.note);

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Center(
            child: Text(
              widget.note.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
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
    );
  }
}
