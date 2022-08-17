import 'package:giflex_app/app-core/endpoints/endpoints.dart';
import 'package:giflex_app/app-core/model/character.dart';
import 'package:giflex_app/app-core/network/dio_client.dart';
import 'package:giflex_app/app-core/service/api_service.dart';
import 'package:giflex_app/app-core/service/locator.dart';
import 'package:giflex_app/app-core/sharedpreference/shared_preference.dart';
import 'package:http/http.dart' as http;

class CharacterService {
  final netWorkLocator = getIt.get<DioClient>();
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();

  Future<List<CharacterModel>> getAllUCharacters() async {
    final response = await netWorkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.getAllCharacters}',
    );
    final data =
        (response.data as List).map((e) => CharacterModel.fromJson(e)).toList();
    return data;
  }
}
