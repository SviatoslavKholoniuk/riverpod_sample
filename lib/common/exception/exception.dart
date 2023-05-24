import 'package:dio/dio.dart';
import 'package:either_option/either_option.dart';

import 'error_response.dart';

// TODO add all required exceptions
Future<Either<NetworkFailure, T>> catchNetwork<T>(
  Future<T> Function() request,
) async {
  try {
    final result = await request();
    return Right(result);
  } on DioError catch (e) {
    return Left(NetworkFailure.fromDioError(e));
  }
}

abstract class NetworkFailure {
  final String message;

  NetworkFailure(this.message);

  factory NetworkFailure.fromDioError(DioError error) {
    if (error.response != null) {
      final response = error.response;
      if (response?.statusCode == 401) {
        return AuthorizeException("Unauthorized access");
      } else {
        try {
          final errorResponse =
              ErrorResponse.fromJson(response?.data as Map<String, dynamic>);
          return NetworkError(
            errorResponse.message ?? "Unknown error",
            code: errorResponse.code,
          );
        } catch (_) {
          return ParsingError("Failed to parse the error response");
        }
      }
    } else if (error.type == DioErrorType.cancel) {
      return NetworkError("Request was cancelled");
    } else {
      return NetworkError(error.message ?? "Unknown error");
    }
  }
}

class NetworkError extends NetworkFailure {
  String? code;

  NetworkError(String message, {this.code}) : super(message);
}

class AuthorizeException extends NetworkFailure {
  AuthorizeException(String message) : super(message);
}

class ParsingError extends NetworkFailure {
  ParsingError(String message) : super(message);
}
