import 'package:dio/dio.dart';
import 'package:rickandmorty/models/character_model.dart';

class ApiService {
  final Dio dio = Dio();
  final String baseUrl = 'https://rickandmortyapi.com/api';

  Future<CharacterModel?> getCharacters(int page) async {
    try {
      final response = await dio.get('$baseUrl/character?page=$page');
      return CharacterModel.fromJson(response.data);
    } catch (e) {
      print("API Hatası: $e"); // Hata mesajını detaylı göster
      return null; // Hata olursa null döndür
    }
  }
}
