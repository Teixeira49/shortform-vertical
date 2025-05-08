import '../repositories/auth_repository.dart';

class GetCurrentTokenUsecase {
  GetCurrentTokenUsecase({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final IAuthRepository _authRepository;

  /// Returns the stored authentication token, or `null` if no token is stored.
  ///
  /// **Parameters:**
  /// - None.
  ///
  /// **Returns:**
  /// - A [Future] of [String?].
  Future<String?> execute() async {
    try {
      return _authRepository.getCurrentToken();
    } catch (e) {
      rethrow;
    }
  }
}
