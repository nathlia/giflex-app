class UserAccountModel {
  final int id;
  final String username;

  UserAccountModel({required this.id, required this.username});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
    };
  }

  factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      id: json['id'],
      username: json['username'],
    );
  }
}
