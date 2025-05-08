
import '../../../../shared/core/exceptions/app_exception.dart';

class NeedToValidateEmailToLoginException extends AppException {
  NeedToValidateEmailToLoginException({
    required super.message,
    int? code,
  }) : super(
          code: code ?? 404,
        );
}
