// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../entities/entities/entities.dart';


class UserModel extends User {
  const UserModel({
    required super.userId,
    required super.profileId,
    required super.firstName,
    required super.lastName,
    required super.plan,
    required super.email,
    required super.verified,
    required super.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user_id': userId,
      'profile_id': profileId,
      'first_name': firstName,
      'last_name': lastName,
      'plan': plan,
      'email': email,
      'verified': verified,
      'image_url': imageUrl,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['user_id'] as int? ?? 0,
      profileId: map['profile_id'] as int? ?? 0,
      firstName: map['first_name'] as String? ?? '',
      lastName: map['last_name'] as String? ?? '',
      plan: map['plan'] as String? ?? '',
      email: map['email'] as String? ?? '',
      verified: map['verified'] as bool? ?? false,
      imageUrl: map['image_url'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  User toEntity() {
    return User(
      userId: userId,
      profileId: profileId,
      firstName: firstName,
      lastName: lastName,
      plan: plan,
      email: email,
      verified: verified,
      imageUrl: imageUrl,
    );
  }
}
