import 'package:dio/dio.dart';

class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message);

  factory ServerFailure.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(message: 'Bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(message: 'Connection error');
      case DioExceptionType.unknown:
        return ServerFailure(message: 'Unknown error');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic data) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: data['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(message: 'Not found, please try again');
    } else if (statusCode == 500) {
      return ServerFailure(message: 'Internal server error, please try again');
    } else {
      return ServerFailure(message: 'Unknown error, please try again');
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class LocalFailure extends Failure {
  LocalFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}
