import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mytica/data/local/db/app_db.dart';

class todo_item extends StatefulWidget {
  Todo todoListItem;
  int index;
  todo_item(this.todoListItem, this.index);

  @override
  State<todo_item> createState() => _todo_itemState();
}

class _todo_itemState extends State<todo_item> {
  // late AppDb _db;

  @override
  void initState() {
    super.initState();

    // _db = AppDb();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
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
                    style: const TextStyle(
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
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Text(
                      //   DateFormat.yMMMd()
                      //       .format(widget.todoListItem.createdAt),
                      //   style: const TextStyle(
                      //     fontSize: 12,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Checkbox(
                      shape: const CircleBorder(),
                      activeColor: const Color(0xff001427),
                      checkColor: Colors.white,
                      splashRadius: 2,
                      value:
                          widget.todoListItem.isCompleted == 0 ? false : true,
                      onChanged: (value) {
                        setState(() {
                          // widget.todoListItem.isCompleted =
                          //     !widget.todoListItem.isCompleted;
                          // if (widget.todoListItem.isCompleted == 0) {
                          //   widget.todoListItem.isCompleted = 1;
                          // } else {
                          //   widget.todoListItem.isCompleted = 0;
                          // }
                        });
                      },
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    IconButton(
                        onPressed: () {
                          // print("Task deleted..");
                          // _db.deleteTodo(widget.todoListItem.id);
                          // _db.close();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Color(0xffd90429),
                        ))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(
            height: 2,
          )
        ],
      ),
    );
  }
}
