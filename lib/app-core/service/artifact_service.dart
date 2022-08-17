import 'dart:convert';

import 'package:giflex_app/app-core/model/artifact.dart';
import 'package:giflex_app/app-core/model/character.dart';
import 'package:giflex_app/app-core/persistence/artifact_persistence.dart';
import 'package:giflex_app/app-core/service/api_service.dart';

class ArtifactService extends ApiService {
  Future<List<ArtifactModel>> getAllArtifacts() async {
    List<ArtifactModel> artifacts = [];

    try {
      final response = await super.client?.get(
            Uri.parse('${super.baseUrl}/characters'),
            headers: super.headers,
          );

      if (response!.statusCode == 200) {
        Iterable list = jsonDecode(response.body);
        artifacts = list.map((i) => ArtifactModel.fromJson(i)).toList();
        for (final a in artifacts) {
          ArtifactPersistence().add(a);
        }
      } else {
        throw Exception('Could not list characters.\n${response.body}');
      }
    } catch (e) {
      throw Exception(e);
    }
    return artifacts;
  }
}
