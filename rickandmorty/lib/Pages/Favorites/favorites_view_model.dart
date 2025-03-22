import 'package:flutter/widgets.dart';
import 'package:rickandmorty/core/shared_preferance.dart';

class FavoritesViewModel extends ChangeNotifier {
  final helper = SharedPreferenceHelper();
  List<int> favorites = [];

  Future<void> getFavorites() async {
    favorites = await helper.getFavorites();
    notifyListeners();
  }
}
