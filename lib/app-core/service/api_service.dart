//import 'package:dio/dio.dart'

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  Dio api = Dio();
  String? accessToken;

  //private secure storage for security token
  //final _storage = const FlutterSecureStorage();

  ApiService() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      //check if theres http in the route, if not set to the url of server
      if (!options.path.contains('http')) {
        options.path = 'http://192.168.100.5:8080${options.path}';
      }

      if (!options.path.contains("login")) {
        //options.queryParameters["userId"] = "xxx";
      }

      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      return handler.next(error);
    }));
  }
}
