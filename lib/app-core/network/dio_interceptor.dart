import 'package:dio/dio.dart';
import 'package:giflex_app/app-core/service/locator.dart';
import 'package:giflex_app/app-core/sharedpreference/shared_preference.dart';

class DioInterceptor extends Interceptor {
  final preferencesLocator = getIt.get<SharedPreferenceHelper>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = preferencesLocator.getUserToken();
    super.onRequest(options, handler);
  }

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   // TODO: implement onResponse
  //   super.onResponse(response, handler);
  // }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   // TODO: implement onError
  //   super.onError(err, handler);
  // }
}
