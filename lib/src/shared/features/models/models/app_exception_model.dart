import 'dart:convert';

class AppExceptionModel {
  final String message;
  final int? code;

  AppExceptionModel({
    required this.message,
    this.code,
  });

  factory AppExceptionModel.fromMap(Map<String, dynamic> map) {
    return AppExceptionModel(
      message: map['message'] as String? ?? '',
      code: map['code'] as int?,
    );
  }

  factory AppExceptionModel.fromJson(String source) =>
      AppExceptionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'code': code,
    };
  }
}
