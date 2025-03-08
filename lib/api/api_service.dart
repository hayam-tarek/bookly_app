import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);
  final String baseUrl = 'https://www.googleapis.com/books/v1/';

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}

class Endpoints {
  static const String getNewestBooks =
      'volumes?Filtering=free-ebooks&q=programming&Sorting=newest';
}

class ApiKeys {
  static const String kind = 'kind';
  static const String totalItems = 'totalItems';
  static const String items = 'items';
}
