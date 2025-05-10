import 'dart:developer';

import '../../core/exceptions/no_current_user_found_exception.dart';
import '../data_source/user_api/user_api.dart';
import '../entities/entities/entities.dart';
import '../repositories/repositories.dart';

class UserRepository implements IUserRepository {
  UserRepository({
    required IUserApi userApi,
  }) : _userApi = userApi;

  final IUserApi _userApi;

  static const _source = 'UserRepository';

  User? _currentUser;
  @override
  User? get currentUser => _currentUser;

  @override
  Future<User> getCurrentUser({required String token}) async {
    try {
      log(
        '📡 Getting current user...',
        name: '$_source.getCurrentUser()',
      );

      if (_currentUser != null) {
        return _currentUser!;
      }

      final user = await _userApi.getCurrentUser(token: token);

      if (user == null) {
        throw NoCurrentUserFoundException(
          message: 'No current user found',
        );
      }

      log(
        '✅ User getted successfully',
        name: '$_source.getCurrentUser()',
      );

      _currentUser = user.toEntity();

      return _currentUser!;
    } catch (e, s) {
      log(
        '❌ An unexpected error ocurred while getting current user',
        name: '$_source.getCurrentUser()',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      log(
        '📡 Signing out...',
        name: '$_source.signOut()',
      );

      // Clear the current user
      _currentUser = null;

      log(
        '✅ Current user cleared successfully',
        name: '$_source.signOut()',
      );
    } catch (e, s) {
      log(
        '❌ An unexpected error occurred while signing out',
        name: '$_source.signOut()',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }
}
