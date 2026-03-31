import 'package:dio/dio.dart';

class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException({required this.message, this.statusCode});

  @override
  String toString() => message;
}

class UnauthorizedException extends AppException {
  UnauthorizedException({String? message})
      : super(message: message ?? 'Session expired. Please login again.', statusCode: 401);
}

class ServerException extends AppException {
  ServerException({String? message})
      : super(message: message ?? 'Server error. Please try again later.', statusCode: 500);
}

class NetworkException extends AppException {
  NetworkException({String? message})
      : super(message: message ?? 'No internet connection.', statusCode: null);
}

class BadRequestException extends AppException {
  BadRequestException({String? message})
      : super(message: message ?? 'Bad request.', statusCode: 400);
}

class NotFoundException extends AppException {
  NotFoundException({String? message})
      : super(message: message ?? 'Resource not found.', statusCode: 404);
}

AppException handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return NetworkException(message: 'Connection timeout. Please try again.');
    case DioExceptionType.connectionError:
      return NetworkException();
    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode;
      final message = error.response?.data['message'] as String?;
      switch (statusCode) {
        case 400:
          return BadRequestException(message: message);
        case 401:
          return UnauthorizedException(message: message);
        case 404:
          return NotFoundException(message: message);
        case 500:
          return ServerException(message: message);
        default:
          return AppException(message: message ?? 'Something went wrong.', statusCode: statusCode);
      }
    default:
      return AppException(message: 'Something went wrong.');
  }
}
