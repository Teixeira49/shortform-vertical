import 'package:formz/formz.dart';

/// [PasswordInput] validation error
enum PasswordValidationError {
  /// Password is empty
  empty,

  /// Password is less then 8 characters
  invalidCharactersNumber,

  /// Password not contains a lowercase
  notContainsLowercase,

  /// Password not contains a uppercase
  notContainsUppercase,

  /// Password not contains a digit
  notContainsDigits,

  /// Password not contains a special character
  notContainsSpecialCharacters,
}

/// Password representation class which extends [FormzInput] and provides
/// validation logic.
class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure({String value = ''}) : super.pure(value);

  /// Dirty representation of [PasswordInput]
  const PasswordInput.dirty({String value = ''}) : super.dirty(value);

  /// Display error if the [PasswordInput] is not valid
  /// and has been modified
  @override
  PasswordValidationError? get displayError => isPure ? null : error;

  /// Convert [PasswordInput] to pure
  PasswordInput get toPure => PasswordInput.pure(value: value);

  @override
  PasswordValidationError? validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordValidationError.empty;
    }

    if (value.length < 8) {
      return PasswordValidationError.invalidCharactersNumber;
    }

    if (!RegExp(_containsLowercaseRegex).hasMatch(value)) {
      return PasswordValidationError.notContainsLowercase;
    }
    if (!RegExp(_containsUppercaseRegex).hasMatch(value)) {
      return PasswordValidationError.notContainsUppercase;
    }

    if (!RegExp(_containsDigitRegex).hasMatch(value)) {
      return PasswordValidationError.notContainsDigits;
    }

    if (!RegExp(_containsSpecialCharacterRegex).hasMatch(value)) {
      return PasswordValidationError.notContainsSpecialCharacters;
    }
    return null;
  }

  /// List of [PasswordValidationError] that the [value] contains
  List<PasswordValidationError> get errorList {
    final errorList = <PasswordValidationError>[];

    if (value.isEmpty) {
      errorList.add(PasswordValidationError.empty);
    }

    if (value.length < 8) {
      errorList.add(PasswordValidationError.invalidCharactersNumber);
    }

    if (!RegExp(_containsLowercaseRegex).hasMatch(value)) {
      errorList.add(PasswordValidationError.notContainsLowercase);
    }
    if (!RegExp(_containsUppercaseRegex).hasMatch(value)) {
      errorList.add(PasswordValidationError.notContainsUppercase);
    }

    if (!RegExp(_containsDigitRegex).hasMatch(value)) {
      errorList.add(PasswordValidationError.notContainsDigits);
    }

    if (!RegExp(_containsSpecialCharacterRegex).hasMatch(value)) {
      errorList.add(PasswordValidationError.notContainsSpecialCharacters);
    }
    return errorList;
  }

  static const String _containsLowercaseRegex = '(?=.*[a-z])';
  static const String _containsUppercaseRegex = '(?=.*[A-Z])';
  static const String _containsDigitRegex = r'(.*\d.*)';
  static const String _containsSpecialCharacterRegex = r'(?=.*\W)';
}
