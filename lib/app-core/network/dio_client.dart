import 'package:dio/dio.dart';
import 'package:giflex_app/app-core/network/dio_interceptor.dart';

class DioClient {
  final _dio = Dio();

  DioClient() {
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;
}
