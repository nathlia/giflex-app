import 'dart:convert';
import 'dart:developer';
import 'package:giflex_app/app-core/model/user_account.dart';
import 'package:giflex_app/app-core/persistence/user_account_persistence.dart';
import 'package:giflex_app/app-core/service/api_service.dart';
import 'package:http/http.dart' as http;

class UserAccountService extends ApiService {
  Future<bool> login(
      {required String username, required String password}) async {
    log('inside user service + login');
    log('username:$username');
    log('password:$password');

    try {
      final content = json
          .encode(<String, String>{'username': username, 'password': password});

      final response = await http.post(Uri.parse('$baseUrl/login'),
          headers: headers, body: content, encoding: null);

      if (response.statusCode == 200) {
        UserAccountModel userLogged =
            UserAccountModel.fromJson(jsonDecode(response.body));

        log(userLogged.username.toString());
        log(userLogged.token.toString());

        UserAccountPersistence().add(userLogged);
        return true;
      } else {
        log('problem: ${response.statusCode}');
        log('error: ${response.body}');
        return false;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
