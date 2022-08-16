import 'package:giflex_app/app-core/service/abstract_service.dart';
import 'package:http/http.dart' as http;

class CharacterService extends AbstractService {
  Future<http.Response> getCharacters() async {
    Map<String, String> headersCliente = <String, String>{
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJuYXR0eSIsImV4cCI6MTY2MDcxMTQ2OH0.iN8gHDUTQkaxSB5ErGt0ZgHby4q3EnHwismcedjUYfQ'
    };

    return http.get(Uri.parse('$API_REST/characters'), headers: headersCliente);
  }
}
