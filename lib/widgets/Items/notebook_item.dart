import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mytica/models/Notebook/Notebook.dart';

class NotebookItem extends StatefulWidget {
  Notebook notebook;
  NotebookItem(this.notebook);

  @override
  State<NotebookItem> createState() => _NotebookItemState();
}

class _NotebookItemState extends State<NotebookItem> {
  @override
  Widget build(BuildContext context) {
    Color colorIndex() {
      const colors = [
        Color(0xfff4a261), //11
        Color(0xff52b788), //10
        Color(0xffe63946), //9
        Color(0xfffff475), //6
        Color(0xff70e000), //8
        Color(0xffd7affa), //5
        Color(0xff5d5d81), //7
        Color(0xfffabd04), //4
        Color(0xff457b9d), //3
        Color(0xfffe6d73), //2
        Color.fromARGB(232, 235, 236, 1), //1
      ];
      if (widget.notebook.id >= 9) {
        var n = widget.notebook.id % 10;
        return colors[n];
      }
      return colors[widget.notebook.id];
    }

    final color = colorIndex();
    return Container(
      margin: const EdgeInsets.all(6.0),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorIndex(),
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
              widget.notebook.name,
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
            widget.notebook.description,
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
                    Text(widget.notebook.tag),
                    Text(DateFormat.yMMMd().format(widget.notebook.createdAt)),
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
