class ArtifactTypeModel {
  final int id;
  final String name;

  ArtifactTypeModel({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory ArtifactTypeModel.fromJson(Map<String, dynamic> json) {
    return ArtifactTypeModel(
      id: json['id'],
      name: json['name'],
    );
  }
}