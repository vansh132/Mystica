import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile-screen";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Yes baby, wait for sometime"),
      ),
    );
  }
}
