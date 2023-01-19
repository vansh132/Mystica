import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;
import 'package:mytica/data/local/db/app_db.dart';
import 'package:mytica/models/reminder/reminder.dart';
import 'package:mytica/screens/submain-screens/todo/todo_screen.dart';

class reminder_item extends StatefulWidget {
  Reminder todoReminderItem;
  int index;
  reminder_item(this.todoReminderItem, this.index);

  @override
  State<reminder_item> createState() => _reminder_itemState();
}

class _reminder_itemState extends State<reminder_item> {
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
      height: 124,
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
                        widget.todoReminderItem.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "Deadline: ",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(widget.todoReminderItem.selectedDate),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
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
                      value: widget.todoReminderItem.isCompleted == 0
                          ? false
                          : true,
                      onChanged: (value) {
                        //To-do: Add Reminder
                        //add async
                        // setState(() async {
                        // int isCompleted;
                        // if (value == true) {
                        //   isCompleted = 1;
                        // } else {
                        //   isCompleted = 0;
                        // }
                        // final todoCompanion = TodosCompanion(
                        //     id: drift.Value(widget.todoReminderItem.id),
                        //     title: drift.Value(widget.todoReminderItem.title),
                        //     isCompleted: drift.Value(isCompleted),
                        //     userId: drift.Value(widget.todoReminderItem.userId));
                        // final db = AppDb();
                        // bool isUpdated = await db.updateTodo(todoCompanion);
                        // print("isUpdated: $isUpdated");
                        // await db.close();
                        // Navigator.of(context).pop();
                        // Navigator.of(context)
                        //     .pushReplacementNamed(TodoScreen.routeName);
                        // });
                      },
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    IconButton(
                        onPressed: () {
                          //To-do: Delete Reminder
                          // final db = AppDb();
                          // await db.deleteTodo(widget.todoReminderItem.id);
                          // await db.close();
                          // Navigator.of(context).pop();
                          // Navigator.of(context)
                          //     .pushReplacementNamed(TodoScreen.routeName);
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
