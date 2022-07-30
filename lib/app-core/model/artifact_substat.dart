import 'package:giflex_app/app-core/model/substat.dart';

class ArtifactSubstatModel {
  final SubstatModel substat;
  final double substatValue;

  ArtifactSubstatModel({required this.substat, required this.substatValue});

  Map<String, dynamic> toJson() {
    return {
      'substat': substat,
      'substatValue': substatValue,
    };
  }

  factory ArtifactSubstatModel.fromJson(Map<String, dynamic> json) {
    return ArtifactSubstatModel(
      substat: json['substat'],
      substatValue: json['substatValue'],

    );
  }
}