import 'app_exception.dart';

class NoCurrentUserFoundException extends AppException {
  NoCurrentUserFoundException({
    required super.message,
    int? code,
  }) : super(
          code: code ?? 404,
        );
}
