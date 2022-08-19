class CharacterModel {
  final int? id;
  final String? name;
  final String? level;
  final String? critRate;
  final String? critDmg;
  // final List<EquippedArtifact>? equippedArtifacts;

  CharacterModel({
    this.id,
    this.name,
    this.level,
    this.critRate,
    this.critDmg,
    // this.equippedArtifacts,
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
      // 'equippedArtifacts': equippedArtifacts,
    };
  }

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    // var list = json['equippedArtifacts'] as List;
    // log(list.runtimeType.toString());
    // List<EquippedArtifact> equippedArtifactsList =
    // list.map((i) => EquippedArtifact.fromJson(i)).toList();

    return CharacterModel(
      id: json['id'],
      name: json['name'],
      level: json['level'],
      critRate: json['critRate'],
      critDmg: json['critDmg'],
      // equippedArtifacts: equippedArtifactsList,
    );
  }
}

// class EquippedArtifact {
//   final String? key;
//   final List<ArtifactModel>? value;

//   EquippedArtifact({
//     this.key,
//     this.value,
//   });

//   @override
//   String toString() {
//     return 'CharacterModel(key: $key, value: $value';
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'key': key,
//       'value': value,
//     };
//   }

//   factory EquippedArtifact.fromJson(Map<String, dynamic> json) {
//     var list = json['equippedArtifacts'] as List;
//     log(list.runtimeType.toString());
//     List<ArtifactModel> value =
//         list.map((i) => ArtifactModel.fromJson(i)).toList();

//     return EquippedArtifact(
//       key: json['key'],
//       value: value,
//     );
//   }
// }
