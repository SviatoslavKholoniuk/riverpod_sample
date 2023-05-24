import 'exception/exception.dart';

class CommonFailureMapper {
  UiError call(NetworkFailure failure) {
    String message;
    switch (failure.runtimeType) {
      case ParsingError:
        message = "Server Error";
        break;
      default:
        message = "An unexpected error occurred. Please try again";
    }
    return UiError(message: message);
  }
}

class UiError {
  final String message;

  UiError({
    required this.message,
  });
}
