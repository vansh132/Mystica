import 'package:flutter/material.dart';

class DetailImageScreen extends StatelessWidget {
  static const routeName = '/detail-image-screen';
  const DetailImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("detail image screen")),
    );
  }
}
