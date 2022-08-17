class UserAccountModel {
  final int? id;
  final String? username;
  final String? password;
  final String? token;

  UserAccountModel({this.id, this.username, this.password, this.token});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'token': token,
    };
  }

  factory UserAccountModel.fromJson(Map<String, dynamic> json) {
    return UserAccountModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      token: json['token'],
    );
  }
}
