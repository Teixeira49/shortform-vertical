// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SignUpUserParams extends Equatable {
  final String name;
  final String lastName;
  final String dni;
  final String email;
  final String password;
  const SignUpUserParams({
    required this.name,
    required this.lastName,
    required this.dni,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        name,
        lastName,
        dni,
        email,
        password,
      ];
}
