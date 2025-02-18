import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_developer_test/models/character.dart';

class CharacterDatasource {
   final String _baseUrl = "https://swapi.dev/api/people/";

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}