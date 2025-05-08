import '../../models/models.dart';

abstract class IUserApi {
  /// Get the current user.
  ///
  /// **Parameters:**
  /// - `token` - A [String] with the user token.
  ///
  /// **Returns:**
  /// - A [Future] of [UserModel] with the current user or `null` if no user is found.
  Future<UserModel?> getCurrentUser({required String token});
}
