class SubstatModel {
  final int id;
  final String name;

  SubstatModel({required this.id, required this.name});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory SubstatModel.fromJson(Map<String, dynamic> json) {
    return SubstatModel(
      id: json['id'],
      name: json['name'],
    );
  }
}