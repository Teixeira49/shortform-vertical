import '../entities/entities.dart';
import '../repositories/auth_repository.dart';

class SignUpUserUseCase {
  SignUpUserUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final IAuthRepository _authRepository;

  /// Sign up a user with the given [params].
  ///
  ///
  /// **Parameters:**
  /// - `params` - A [SignUpUserParams] with the params to sign up a user.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> execute({required SignUpUserParams params}) async {
    try {
      return _authRepository.signUpUser(
        params: params,
      );
    } catch (e) {
      rethrow;
    }
  }
}
