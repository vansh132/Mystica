import 'package:flutter/material.dart';

class DetailJournalScreen extends StatelessWidget {
  static const routeName = "/detail-journal-screen";
  const DetailJournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Detail journal screen"),
      ),
    );
  }
}
