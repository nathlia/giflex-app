import 'dart:convert';
import 'dart:developer';

import 'package:giflex_app/app-core/model/character.dart';
import 'package:giflex_app/app-core/persistence/character_persistence.dart';
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
        Iterable list = json.decode(response.body);
        characters = list.map((i) => CharacterModel.fromJson(i)).toList();
        for (final c in characters) {
          CharacterPersistence().add(c);
        }
      } else {
        throw Exception('Could not list characters.\n${response.body}');
      }
    } catch (e) {
      throw Exception(e);
    }
    return characters;
  }

  Future<CharacterModel> getCharacter(int id) async {
    CharacterModel character = CharacterModel();

    try {
      final response = await super.client?.get(
            Uri.parse('${super.baseUrl}/characters/$id'),
            headers: super.headers,
          );

      if (response!.statusCode == 200) {
        character = CharacterModel.fromJson(json.decode(response.body));
        log('selected Character:${character.name!}');
      } else {
        throw Exception('Falha ao buscar material ${response.body}');
      }
    } catch (e) {
      throw Exception(e);
    }
    return character;
  }

  Future<String> edit(CharacterModel character) async {
    try {
      final response = await super.client?.put(
            Uri.parse('${super.baseUrl}/characters/${character.id}'),
            headers: super.headers,
            body: json.encode(character.toJson()),
            encoding: null,
          );
      if (response!.statusCode == 200) {
        return "Character edited with success!";
      } else {
        return "Could not edit character";
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
