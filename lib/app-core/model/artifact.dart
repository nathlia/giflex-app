import 'package:giflex_app/app-core/model/artifact_set_type.dart';
import 'package:giflex_app/app-core/model/artifact_substat.dart';
import 'package:giflex_app/app-core/model/artifact_type.dart';
import 'package:giflex_app/app-core/model/substat.dart';

class ArtifactModel {
  final int id;
  final ArtifactTypeModel artifactType;
  final ArtifactSetTypeModel artifactSetType;
  final SubstatModel mainstat;
  final double mainStatValue;
  //final ArtifactSubstatModel artifactSubstatModel;
  //substats

  ArtifactModel({
    required this.id,
    required this.artifactType,
    required this.artifactSetType,
    required this.mainstat,
    required this.mainStatValue,
  });

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'id': id,
      'artifactType': artifactType,
      'artifactSetType': artifactSetType,
      'mainstat': mainstat,
      'mainStatValue': mainStatValue,
      //'artifactSubstatModel': artifactSubstatModel,
    };
  }

  factory ArtifactModel.fromJson(Map<String, dynamic> json) {
    return ArtifactModel(
      id: json['id'],
      artifactType: json['artifactType'],
      artifactSetType: json['artifactSetType'],
      mainstat: json['mainstat'],
      mainStatValue: json['mainStatValue'],
      //artifactSubstatModel: json['artifactSubstatModel']
    );
  }
}
