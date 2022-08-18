import 'dart:developer';

import 'package:giflex_app/app-core/model/artifact_set_type.dart';
import 'package:giflex_app/app-core/model/artifact_substat.dart';
import 'package:giflex_app/app-core/model/artifact_type.dart';
import 'package:giflex_app/app-core/model/substat.dart';

class ArtifactModel {
  final int id;
  final List<ArtifactTypeModel>? artifactType;
  final List<ArtifactSetTypeModel>? artifactSetType;
  final List<SubstatModel>? mainstat;
  final double? mainStatValue;
  //final ArtifactSubstatModel artifactSubstatModel;
  //substats

  ArtifactModel({
    required this.id,
    this.artifactType,
    this.artifactSetType,
    this.mainstat,
    this.mainStatValue,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'artifactType': artifactType,
      'artifactSetType': artifactSetType,
      'mainstat': mainstat,
      'mainStatValue': mainStatValue,
      //'artifactSubstatModel': artifactSubstatModel,
    };
  }

  factory ArtifactModel.fromJson(Map<String, dynamic> json) {
    var list = json['artifactType'] as List<Map<String, dynamic>>;
    log(list.runtimeType.toString());
    List<ArtifactTypeModel> artifactTypeList =
        list.map((i) => ArtifactTypeModel.fromJson(i)).toList();

    list = json['artifactSetType'] as List<Map<String, dynamic>>;
    log(list.runtimeType.toString());
    List<ArtifactSetTypeModel> artifactSetTypeList =
        list.map((i) => ArtifactSetTypeModel.fromJson(i)).toList();

    list = json['mainStatValue'] as List<Map<String, dynamic>>;
    log(list.runtimeType.toString());
    List<SubstatModel> mainStatValueList =
        list.map((i) => SubstatModel.fromJson(i)).toList();

    return ArtifactModel(
      id: json['id'],
      artifactType: artifactTypeList,
      artifactSetType: artifactSetTypeList,
      mainstat: mainStatValueList,
      mainStatValue: json['mainStatValue'],
      //artifactSubstatModel: json['artifactSubstatModel']
    );
  }
}
