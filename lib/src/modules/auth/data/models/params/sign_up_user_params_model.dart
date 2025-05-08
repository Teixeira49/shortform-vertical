import '../../../domain/entities/entities.dart';

class SignUpUserParamsModel {
  final String name;
  final String lastName;
  final String dni;
  final String email;
  final String password;
  SignUpUserParamsModel({
    required this.name,
    required this.lastName,
    required this.dni,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'lastname': lastName,
      'document_num': dni,
      'email': email,
      'password': password,
    };
  }

  factory SignUpUserParamsModel.fromEntity(SignUpUserParams entity) {
    return SignUpUserParamsModel(
      name: entity.name,
      lastName: entity.lastName,
      dni: entity.dni,
      email: entity.email,
      password: entity.password,
    );
  }
}
