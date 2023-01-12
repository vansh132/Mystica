import 'package:flutter/material.dart';

class ReminderScreen extends StatelessWidget {
  static const String routeName = '/reminder-screen';
  const ReminderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminder"),
      ),
      body: Center(child: Text("Reminder Screen")),
    );
  }
}
