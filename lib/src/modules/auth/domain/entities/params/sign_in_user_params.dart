import 'package:equatable/equatable.dart';

class SignInUserParams extends Equatable {
  final String email;
  final String password;

  const SignInUserParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
