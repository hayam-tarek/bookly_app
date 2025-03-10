import 'package:bookly_app/core/api/api_service.dart';
import 'package:bookly_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService extends ApiService {
  static final DioService _instance = DioService._internal();
  late final Dio _dio;

  factory DioService() {
    return _instance;
  }

  DioService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  @override
  Future<Map<String, dynamic>> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.get(endPoint);
    return response.data;
  }

  @override
  Future delete(
      {required String endPoint,
      Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) {
    throw UnimplementedError();
  }

  @override
  Future patch(
      {required String endPoint,
      Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) {
    throw UnimplementedError();
  }

  @override
  Future post(
      {required String endPoint,
      Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) {
    throw UnimplementedError();
  }
}
