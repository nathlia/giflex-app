import 'package:get_it/get_it.dart';
import 'package:giflex_app/app-core/network/dio_client.dart';
import 'package:giflex_app/app-core/sharedpreference/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
//
Future<void> setup() async {
  final preferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferenceHelper>(
    SharedPreferenceHelper(preferences: preferences),
  );
  getIt.registerSingleton<DioClient>(DioClient());
}
