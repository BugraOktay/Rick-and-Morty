import 'package:flutter/material.dart';
import 'package:rickandmorty/core/api_service.dart';
import 'package:rickandmorty/models/character_model.dart';

class CharacterViewModel extends ChangeNotifier {
  // 🔥 Singleton için statik bir değişken
  static final CharacterViewModel _instance = CharacterViewModel._internal();

  // 🏗️ Private Constructor (Dışarıdan `new` ile oluşturulamaz)
  CharacterViewModel._internal();

  // 🌍 Singleton örneğini döndüren `factory constructor`
  factory CharacterViewModel() {
    return _instance;
  }

  final List<CharacterModel> _charactersModel = [];
  List<CharacterModel> get charactersModel => _charactersModel;

  void getCharacters(int page) async {
    final result = await ApiService().getCharacters(page);
    if (result != null) {
      _charactersModel.add(result);
      notifyListeners();
    } else {
      print("Karakter verisi çekilemedi!");
    }
  }

  var x = 2;
  get xx => x;
  void inc() {
    x++;
    notifyListeners();
  }
}
