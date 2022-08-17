import 'dart:io';

import 'package:giflex_app/app-core/persistence/user_account_persistence.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AuthInterceptor extends InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    if (UserAccountPersistence.loggedUser != null) {
      data.headers[HttpHeaders.authorizationHeader] =
          'Bearer ${UserAccountPersistence.loggedUser!.token.toString()}';
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
