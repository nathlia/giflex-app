import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String token = "TOKEN";
  final SharedPreferences preferences;

  SharedPreferenceHelper({required this.preferences});

  Future<void> setUserToken({required String userToken}) async {
    await preferences.setString(token, userToken);
  }

  String? getUserToken() {
    final userToken = preferences.getString(token);
    return userToken;
  }
}
