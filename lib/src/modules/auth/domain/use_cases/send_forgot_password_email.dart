
import '../repositories/auth_repository.dart';

class SendForgotPasswordEmailUseCase {
  SendForgotPasswordEmailUseCase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final IAuthRepository _authRepository;

  /// Send a forgot password email to the user with the given [email].
  ///
  /// **Parameters:**
  /// - `email` - A [String] with the email to send the forgot password email.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> execute({required String email}) async {
    try {
      return _authRepository.forgotPassword(
        email: email,
      );
    } catch (e) {
      rethrow;
    }
  }
}
