import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio _dio;

  DioClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3001/api/', // Mockoon URL
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  factory DioClient() => _instance;

  Dio get dio => _dio;
}
