class CharacterModel {
  final int id;
  final String name;
  final String level;
  final String critRate;
  final String critDmg;
  // final Artifact[]? quippedArtifacts;

  CharacterModel(this.id, this.name, this.level, this.critRate, this.critDmg);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'level': level,
      'critRate': critRate,
      'critDmg': critDmg,
    };
  }

  // factory Character.fromJson(Map<String, dynamic> json) {
  //   return Character(
  //     id: json['id'],
  //     name: json['name'],
  //     level: json['level'],
  //     critRate: json['critRate'],
  //     critDmg: json['critDmg'],
  //   );
  // }
}
