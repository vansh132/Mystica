import 'package:flutter/material.dart';

class Album with ChangeNotifier {
  final String id;
  final String title;
  final String desription;
  final DateTime createdAt;

  Album({
    required this.id,
    required this.title,
    required this.desription,
    required this.createdAt,
  });
}
