import 'dart:convert';

import 'package:giflex_app/app-core/model/character.dart';
import 'package:giflex_app/app-core/service/api_service.dart';

class CharacterService extends ApiService {
  Future<List<CharacterModel>> getAllCharacters() async {
    List<CharacterModel> characters = [];

    try {
      final response = await super.client?.get(
            Uri.parse('${super.baseUrl}/characters'),
            headers: super.headers,
          );

      if (response!.statusCode == 200) {
        Iterable list = jsonDecode(response.body);
        characters = list.map((i) => CharacterModel.fromJson(i)).toList();
      } else {
        throw Exception('Could not list characters.\n${response.body}');
      }
    } catch (e) {
      throw Exception(e);
    }
    return characters;
  }
}
