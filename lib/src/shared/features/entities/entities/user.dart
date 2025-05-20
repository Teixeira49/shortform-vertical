// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final int userId;
  final String name;
  final String lastname;
  final String documentNum;
  final String email;

  const User({
    required this.id,
    required this.userId,
    required this.name,
    required this.lastname,
    required this.documentNum,
    required this.email,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        lastname,
        documentNum,
        email,
      ];

  String get fullName => '$name $lastname';

  User copyWith({
    int? id,
    int? userId,
    String? name,
    String? lastname,
    String? documentNum,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      documentNum: documentNum ?? this.documentNum,
      email: email ?? this.email,
    );
  }

  static const empty = User(
    id: 0,
    userId: 0,
    name: '',
    lastname: '',
    documentNum: '',
    email: '',
  );

  static const emptySkeletonizer = User(
    id: 1,
    userId: 1,
    name: 'Name',
    lastname: 'Lastname',
    documentNum: 'Document',
    email: 'email@email.com',
  );

  get userFullName => '$name $lastname';
}
