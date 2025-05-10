import '../entities/entities/entities.dart';

abstract class IUserRepository {
  User? get currentUser;

  /// Returns the current user, or `null` if no user is stored.
  ///
  /// **Parameters:**
  /// - `token` - A [String] with the token to get the current user.
  ///
  /// **Returns:**
  /// - A [Future] of [User].
  ///
  /// **Throws:**
  /// - A [NoCurrentUserFoundException] if the user is not found.
  Future<User> getCurrentUser({required String token});

  Future<void> signOut();
}
