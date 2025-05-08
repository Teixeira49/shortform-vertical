import '../../../../shared/modules/domain/repositories/user_repository.dart';
import '../repositories/auth_repository.dart';

class SignOutUserUseCase {
  SignOutUserUseCase({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository;

  final IAuthRepository _authRepository;
  final IUserRepository _userRepository;

  /// Sign out the current user.
  ///
  /// **Parameters:**
  /// - None.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> execute() async {
    try {
      await _userRepository.signOut();
      return _authRepository.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
