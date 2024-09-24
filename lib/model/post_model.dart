import 'package:flutter/material.dart';

class Post with ChangeNotifier {
  late final String _title;

  late final String _desc;

  late final String? _imageUrl;

  late final DateTime _date;

  String get title => _title;

  String get desc => _desc;

  String? get imageUrl => _imageUrl;

  DateTime get date => _date;

  void display() {}
}