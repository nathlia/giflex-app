class ArtifactSetTypeModel {
  final int id;
  final String name;
  final String twopieces;
  final String fourpieces;

  ArtifactSetTypeModel({required this.id, required this.name, required this.twopieces, required this.fourpieces});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'twopieces': twopieces,
      'fourpieces': fourpieces,
    };
  }

  factory ArtifactSetTypeModel.fromJson(Map<String, dynamic> json) {
    return ArtifactSetTypeModel(
      id: json['id'],
      name: json['name'],
      twopieces: json['twopieces'],
      fourpieces: json['fourpieces'],
    );
  }
}