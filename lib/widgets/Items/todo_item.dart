import 'package:flutter/material.dart';
import 'package:mytica/models/todo/todo.dart';
import 'package:intl/intl.dart';

class todo_item extends StatefulWidget {
  TODO todoListItem;
  int index;
  todo_item(this.todoListItem, this.index);

  @override
  State<todo_item> createState() => _todo_itemState();
}

class _todo_itemState extends State<todo_item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      height: 116,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 32,
                  child: Text(
                    "${widget.index + 1}",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.todoListItem.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd()
                            .format(widget.todoListItem.createdAt),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      shape: CircleBorder(),
                      activeColor: Color(0xff001427),
                      checkColor: Colors.white,
                      splashRadius: 2,
                      value: widget.todoListItem.isCompleted,
                      onChanged: (value) {
                        setState(() {
                          widget.todoListItem.isCompleted =
                              !widget.todoListItem.isCompleted;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            height: 2,
          )
        ],
      ),
    );
  }
}
