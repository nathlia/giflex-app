import 'package:giflex_app/app-core/interceptors/interceptor.dart';
import 'package:http_interceptor/http/http.dart';

class ApiService {
  String? accessToken;
  InterceptedClient? client;

  final String baseUrl = 'http://192.168.100.5:8080';

  Map<String, String> headers = <String, String>{
    'Content-type': 'application/json',
    'Authorization': ''
  };

  ApiService() {
    client = InterceptedClient.build(interceptors: [AuthInterceptor()]);
  }
}
