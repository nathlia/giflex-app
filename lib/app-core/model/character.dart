import 'dart:developer';

import 'package:giflex_app/app-core/model/artifact.dart';

class CharacterModel {
  final int? id;
  final String? name;
  final String? level;
  final String? critRate;
  final String? critDmg;
  //final List<ArtifactModel>? equippedArtifacts;

  CharacterModel({
    this.id,
    this.name,
    this.level,
    this.critRate,
    this.critDmg,
    //this.equippedArtifacts,
  });

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, level: $level, critRate: $critRate, critDmg: $critDmg';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'critRate': critRate,
      'critDmg': critDmg,
      //'equippedArtifacts': equippedArtifacts,
    };
  }

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    // var list = json['equippedArtifacts'] as List<Map<String, dynamic>>;
    // log(list.runtimeType.toString());
    // List<ArtifactModel> equippedArtifactsList =
    //     list.map((i) => ArtifactModel.fromJson(i)).toList();

    return CharacterModel(
      id: json['id'],
      name: json['name'],
      level: json['level'],
      critRate: json['critRate'],
      critDmg: json['critDmg'],
      //equippedArtifacts: equippedArtifactsList,
    );
  }
}
