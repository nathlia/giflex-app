import 'package:giflex_app/app-core/model/artifact.dart';
import 'package:giflex_app/app-core/model/character.dart';

class CharacterArtifact {
  final CharacterModel? characterId;
  final ArtifactModel? artifactId;

  CharacterArtifact({this.characterId, this.artifactId});

  Map<String, dynamic> toJson() {
    return {
      'characterId': characterId,
      'artifactId': artifactId,
    };
  }

  factory CharacterArtifact.fromJson(Map<String, dynamic> json) =>
      CharacterArtifact(
        characterId: CharacterModel.fromJson(json['characterId']),
        artifactId: ArtifactModel.fromJson(json['artifactId']),
      );
}
