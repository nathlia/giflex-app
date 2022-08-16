class UserAccountModel {
  final int id;
  final String username;
  final String token;

  UserAccountModel(
      {required this.id, required this.username, required this.token});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'token': token,
    };
  }

  factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      id: json['id'],
      username: json['username'],
      token: json['token'],
    );
  }
}
