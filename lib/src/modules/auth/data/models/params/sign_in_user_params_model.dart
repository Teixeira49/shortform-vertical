import '../../../domain/entities/entities.dart';

class SignInUserParamsModel {
  final String email;
  final String password;

  SignInUserParamsModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SignInUserParamsModel.fromEntity(SignInUserParams entity) {
    return SignInUserParamsModel(
      email: entity.email,
      password: entity.password,
    );
  }
}
