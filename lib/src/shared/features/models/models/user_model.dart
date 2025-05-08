// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../modules/domain/entities/entities.dart';


class UserModel extends User {
  const UserModel({
    required super.id,
    required super.userId,
    required super.name,
    required super.lastname,
    required super.documentNum,
    required super.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'name': name,
      'lastname': lastname,
      'document_num': documentNum,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int? ?? 0,
      userId: map['user_id'] as int? ?? 0,
      name: map['name'] as String? ?? '',
      lastname: map['lastname'] as String? ?? '',
      documentNum: map['document_num'] as String? ?? '',
      email: map['email'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  User toEntity() {
    return User(
      id: id,
      userId: userId,
      name: name,
      lastname: lastname,
      documentNum: documentNum,
      email: email,
    );
  }
}
