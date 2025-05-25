import 'dart:developer';

import '../../../../shared/features/data_source/device_storage/device_storage_api.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_source/remote/auth_api.dart';
import '../models/models.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository({
    required IAuthApi authApi,
    required IDeviceStorageApi storage,
  })  : _authApi = authApi,
        _storage = storage;

  static const _source = 'UserRepository';

  static const _storageTokenKey = '__token__';

  final IAuthApi _authApi;
  final IDeviceStorageApi _storage;

  @override
  Future<void> signUpUser({required SignUpUserParams params}) async {
    try {
      log(
        '📡 Signing up...',
        name: '$_source.signUp()',
      );

      final value = await _storage.getValue(_storageTokenKey);
      if (value != null) {
        await _storage.deleteValue(_storageTokenKey);
      }

      final token = params.email;
      //await _authApi.signUpUser(
      //  params: SignUpUserParamsModel.fromEntity(params),
      //);

      await _storage.storeValue(key: _storageTokenKey, value: token);

      log(
        '✅ Sign up completed successfully',
        name: '$_source.signUp()',
      );
    } catch (e, s) {
      log(
        '❌ An unexpected error ocurred while signing up',
        name: '$_source.signUp()',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  @override
  Future<void> signInUser({required SignInUserParams params}) async {
    try {
      log(
        '📡 Signing in...',
        name: '$_source.signIn()',
      );

      final value = await _storage.getValue(_storageTokenKey);
      if (value != null) {
        await _storage.deleteValue(_storageTokenKey);
      }

      final token = params.email;
      //await _storage.deleteValue(_storageTokenKey);

      //final token = await _authApi.signInUser(
      //  params: SignInUserParamsModel.fromEntity(params),
      //);

      await _storage.storeValue(key: _storageTokenKey, value: token);

      log(
        '✅ Sign in completed successfully',
        name: '$_source.signIn()',
      );
    } catch (e, s) {
      log(
        '❌ An unexpected error ocurred while signing in',
        name: '$_source.signIn()',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  @override
  Future<void> forgotPassword({required String email}) async {
    try {
      log(
        '📡 Sending forgot password email...',
        name: '$_source.forgotPassword()',
      );

      await _authApi.forgotPassword(email: email);

      log(
        '✅ Forgot password email sent successfully',
        name: '$_source.forgotPassword()',
      );
    } catch (e, s) {
      log(
        '❌ An unexpected error ocurred while sending forgot password email',
        name: '$_source.forgotPassword()',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  @override
  Future<String?> getCurrentToken() async {
    try {
      log('🔑 Getting auth token', name: '$_source.getCurrentToken()');

      final token = await _storage.getValue(_storageTokenKey);

      if (token == null) {
        log('🔑❌ No auth token found', name: '$_source.getCurrentToken()');

        return null;
      }

      log('🔑✅ Auth token fetched: $token', name: '$_source.getCurrentToken()');

      return token;
    } catch (e, s) {
      log(
        '❌ An unexpected error ocurred while fetching the auth token',
        name: '$_source.getCurrentToken()',
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
      await _storage.deleteValue(_storageTokenKey);

      await _authApi.signOut();


      //await _storage.deleteValue('user');

      log(
        '✅ Sign out completed successfully',
        name: '$_source.signOut()',
      );
    } catch (e, s) {
      log(
        '❌ An unexpected error ocurred while signing out',
        name: '$_source.signOut()',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }
}
