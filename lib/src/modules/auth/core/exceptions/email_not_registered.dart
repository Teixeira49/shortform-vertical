
import '../../../../shared/core/exceptions/app_exception.dart';

class EmailNotRegisteredException extends AppException {
  EmailNotRegisteredException({
    required super.message,
    int? code,
  }) : super(
          code: code ?? 403,
        );
}
