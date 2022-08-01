import 'package:giflex_app/app-core/model/artifact.dart';

class CharacterModel {
  final int? id;
  final String? name;
  final String? level;
  final String? critRate;
  final String? critDmg;
  //final ArtifactModel equippedArtifacts;

  CharacterModel({
    this.id,
    this.name,
    this.level,
    this.critRate,
    this.critDmg,
    //required this.equippedArtifacts
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'critRate': critRate,
      'critDmg': critDmg,
    };
  }

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      level: json['level'],
      critRate: json['critRate'],
      critDmg: json['critDmg'],
      //equippedArtifacts: json['equippedArtifacts'],
    );
  }
}
