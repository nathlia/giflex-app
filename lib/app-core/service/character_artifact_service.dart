import 'dart:convert';

import 'package:giflex_app/app-core/model/character_artifact.dart';
import 'package:giflex_app/app-core/persistence/character_artifact_persistence.dart';
import 'package:giflex_app/app-core/service/api_service.dart';

class CharacterArtifactService extends ApiService {
  Future<List<CharacterArtifact>> getAllCharacterArtifacts() async {
    List<CharacterArtifact> characterArtifacts = [];

    try {
      final response = await super.client?.get(
            Uri.parse('${super.baseUrl}/artifact-set'),
            headers: super.headers,
          );

      if (response!.statusCode == 200) {
        Iterable list = jsonDecode(response.body);
        characterArtifacts =
            list.map((i) => CharacterArtifact.fromJson(i)).toList();
        for (final c in characterArtifacts) {
          CharacterArtifactPersistence().add(c);
        }
      } else {
        throw Exception(
            'Could not list character artifacts.\n${response.body}');
      }
    } catch (e) {
      throw Exception(e);
    }
    return characterArtifacts;
  }
}
