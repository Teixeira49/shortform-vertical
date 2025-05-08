import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppApiRestResponseModel {
  final String message;
  final int code;
  final Map<String, dynamic> data;
  final String? accessToken;

  const AppApiRestResponseModel({
    required this.message,
    required this.code,
    required this.data,
    this.accessToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'code': code,
      if (accessToken != null) 'accessToken': accessToken,
    };
  }

  factory AppApiRestResponseModel.fromMap(Map<String, dynamic> map) {
    return AppApiRestResponseModel(
      message: map['message'] as String? ?? '',
      code: map['code'] as int? ?? 0,
      data: map['data'] is String
          ? ({'data': map['data'] as String? ?? ''})
          : map['data'] as Map<String, dynamic>? ?? <String, dynamic>{},
      accessToken:
          map['accessToken'] != null ? map['accessToken'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppApiRestResponseModel.fromJson(String source) =>
      AppApiRestResponseModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
