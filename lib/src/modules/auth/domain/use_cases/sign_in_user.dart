
import '../entities/entities.dart';
import '../repositories/auth_repository.dart';

class SignInUserUseCase {
  SignInUserUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final IAuthRepository _authRepository;

  /// Sign in a user with the given [params].
  ///
  ///
  /// **Parameters:**
  /// - `params` - A [SignInUserParams] with the params to sign in a user.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> execute({required SignInUserParams params}) async {
    try {
      return _authRepository.signInUser(
        params: params,
      );
    } catch (e) {
      rethrow;
    }
  }
}
