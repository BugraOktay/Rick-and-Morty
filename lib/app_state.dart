import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favorites = prefs.getStringList('ff_favorites')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _favorites;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _page = 1;
  int get page => _page;
  set page(int value) {
    _page = value;
  }

  List<dynamic> _favorites = [];
  List<dynamic> get favorites => _favorites;
  set favorites(List<dynamic> value) {
    _favorites = value;
    prefs.setStringList(
        'ff_favorites', value.map((x) => jsonEncode(x)).toList());
  }

  void addToFavorites(dynamic value) {
    favorites.add(value);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => jsonEncode(x)).toList());
  }

  void removeFromFavorites(dynamic value) {
    favorites.remove(value);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromFavorites(int index) {
    favorites.removeAt(index);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => jsonEncode(x)).toList());
  }

  void updateFavoritesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    favorites[index] = updateFn(_favorites[index]);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInFavorites(int index, dynamic value) {
    favorites.insert(index, value);
    prefs.setStringList(
        'ff_favorites', _favorites.map((x) => jsonEncode(x)).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
