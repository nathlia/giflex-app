import 'package:http/http.dart' as http;

class AbstractService {
  final String API_REST = 'http://127.0.0.1:8080';
  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };
}
