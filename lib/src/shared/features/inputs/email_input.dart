import 'package:formz/formz.dart';

/// Email valdiation errors
enum EmailValidationError {
  /// Email is empty
  empty,

  /// Email is invalid, not match with email pattern.
  invalid,
}

/// Email representation class which extends [FormzInput] and provides
/// validation logic.
class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure({String value = ''}) : super.pure(value);

  /// [EmailInput] has been modified with [value]
  const EmailInput.dirty({String value = ''}) : super.dirty(value);

  /// Display error if the [EmailInput] is not valid
  /// and has been modified
  @override
  EmailValidationError? get displayError => isPure ? null : error;

  /// Convert [EmailInput] to pure
  EmailInput get toPure => EmailInput.pure(value: value);

  @override
  EmailValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailValidationError.empty;
    }

    if (!RegExp(_emailPattern).hasMatch(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }

  static const String _emailPattern =
      r'^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*$';
}
