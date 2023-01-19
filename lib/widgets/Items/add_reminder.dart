import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddReminder extends StatefulWidget {
  Function addReminder;

  AddReminder(this.addReminder);
  @override
  State<AddReminder> createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  final _titleController = TextEditingController();
  final _timeController = TextEditingController();

  void _submitData() {
    final enteredReminder = _titleController.text;

    if (enteredReminder.isEmpty) {
      return;
    }

    widget.addReminder(enteredReminder);

    Navigator.of(context).pop();
    print(_titleController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFFf1faee),
      padding: EdgeInsets.all(32),
      height: 250,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 950,
              child: TextField(
                onSubmitted: (_) => _submitData(),
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                ),
              ),
            ),
            SizedBox(
                width: 950,
                child: TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        // minTime: DateTime(2018, 3, 5),
                        // maxTime: DateTime(2019, 6, 7),
                        onChanged: (date) {
                          print('change $date');
                        },
                        onConfirm: (date) {
                          print('confirm $date');
                        },
                        currentTime: DateTime.now(),
                      );
                    },
                    child: Text("Date & Time"))),
            SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: _submitData,
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 16),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
