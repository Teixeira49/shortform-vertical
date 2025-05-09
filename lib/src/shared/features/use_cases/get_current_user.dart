import '../../../modules/auth/domain/repositories/auth_repository.dart';
import '../../modules/domain/entities/entities.dart';
import '../../modules/domain/repositories/user_repository.dart';

class GetCurrentUserUseCase {
  GetCurrentUserUseCase({
    required IUserRepository userRepository,
    required IAuthRepository authRepository,
  })  : _userRepository = userRepository,
        _authRepository = authRepository;

  final IAuthRepository _authRepository;
  final IUserRepository _userRepository;

  /// Get the current user.
  ///
  /// **Returns:**
  /// - A [Future] of [User] with the current user.
  ///
  /// **Throws:**
  /// - A [NoCurrentUserFoundException] if the user is not found.

  Future<User> execute() async {
    try {
      final token = await _authRepository.getCurrentToken() ?? '';

      return _userRepository.getCurrentUser(token: token);
    } catch (e) {
      rethrow;
    }
  }
}
