import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  late SharedPreferences prefs;

  SharedPreferenceHelper();

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<List<int>> getFavorites() async {
    await initPrefs(); // Eğer daha önce başlatılmadıysa başlat
    List<String>? stringList = prefs.getStringList("fav");
    if (stringList == null) return []; // Eğer null ise boş liste döndür
    return stringList.map((e) => int.parse(e)).toList();
  }

  Future<void> toggleFavorite(int id) async {
    List<int> favorites = await getFavorites();
    if (!favorites.contains(id)) {
      // Aynı ID eklenmesin
      favorites.add(id);
      await prefs.setStringList(
        "fav",
        favorites.map((e) => e.toString()).toList(),
      );
    } else {
      // Eğer aynı ID varsa kaldır
      removeFavorite(id);
    }
  }

  Future<void> removeFavorite(int id) async {
    List<int> favorites = await getFavorites();
    favorites.remove(id);
    await prefs.setStringList(
      "fav",
      favorites.map((e) => e.toString()).toList(),
    );
  }
}
