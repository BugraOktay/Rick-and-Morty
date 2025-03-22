import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();

  AppState._internal();

  factory AppState() => _instance;

  String _username = "Mis";
  String get username => _username;

  set username(String value) {
    _username = value;
    notifyListeners();
  }
}
