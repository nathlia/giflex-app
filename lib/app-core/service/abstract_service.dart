import 'package:http/http.dart' as http;

class AbstractService {
  final String API_REST = 'http://192.168.100.5:8080';

  Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json'
  };
}
