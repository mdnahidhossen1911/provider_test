class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
    : super(message, 'Error During communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid request');
}

class UnAuthorException extends AppException {
  UnAuthorException([String? message]) : super(message, 'Unauthorised request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid input');
}
