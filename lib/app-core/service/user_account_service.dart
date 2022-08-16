import 'dart:convert';
import 'dart:developer';
import 'package:giflex_app/app-core/model/user_account.dart';
import 'package:giflex_app/app-core/persistence/user_account_persistence.dart';
import 'package:giflex_app/app-core/service/abstract_service.dart';
import 'package:http/http.dart' as http;

class UserAccountService extends AbstractService {
  Future<bool> login(
      {required String username, required String password}) async {
    log('dentro de usuario service + login');

    final content = json
        .encode(<String, String>{'username': username, 'password': password});

    final response = await http.post(Uri.parse('$API_REST/login'),
        headers: headers, body: content, encoding: null);

    if (response.statusCode == 200) {
      UserAccountModel u = UserAccountModel.fromJson(jsonDecode(response.body));
      log(u.username);
      log(u.token);
      UserAccountPersistence().add(u);
      return true;
    } else {
      log('problem: ${response.statusCode}');
      log('error: ${response.body}');
      return false;
    }
  }

  list() async {
    log('inside list ....');
    log(UserAccountPersistence().getUserAccounts().toString());
  }

  usuarioPersistence() {
    // Usuario u2 = Usuario(id: 3, email: 'rin@email.com', senha: '123');
    // Usuario u3 = Usuario(id: 4, email: 'huacheng@email.com', senha: '123');
    // Usuario u4 = Usuario(id: 5, email: 'lelouch@email.com', senha: '123');
    // Usuario u5 = Usuario(id: 6, email: 'mikaela@email.com', senha: '123');

    // UsuarioPersistence().salvar(u2);
    // UsuarioPersistence().salvar(u3);
    // UsuarioPersistence().salvar(u4);
    // UsuarioPersistence().salvar(u5);
  }
}
