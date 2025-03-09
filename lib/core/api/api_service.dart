abstract class ApiService {
  Future<dynamic> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
  Future<dynamic> post({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  });
  Future<dynamic> patch({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  });
  Future<dynamic> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  });
}
