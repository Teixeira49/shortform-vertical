import 'dart:developer';

import 'package:venetiktok/src/modules/profile/data/models/params/delete_account_params_model.dart';
import 'package:venetiktok/src/modules/profile/domain/entities/params/params.dart';

import '../../../../shared/features/data_source/device_storage/device_storage_api.dart';
import '../../domain/repositories/profile_repository.dart';
import '../data_source/remote/profile_api.dart';

class ProfileRepository implements IProfileRepository {
  ProfileRepository({
    required IProfileApi profileApi,
    required IDeviceStorageApi storage,
  })  : _profileApi = profileApi,
        _storage = storage;

  static const _source = 'ProfileRepository';

  static const _storageTokenKey = '__token__';

  final IProfileApi _profileApi;
  final IDeviceStorageApi _storage;

  @override
  Future<void> deleteAccount({required DeleteAccountParams params}) async {
    try {
      log(
        '📡 Deleting user account...',
        name: '$_source.deleteAccount()',
      );

      await _profileApi.deleteAccount(params: DeleteAccountParamsModel(userId: params.userId));

      await _storage.deleteValue(_storageTokenKey);

      log(
        '✅ User account deleted successfully',
        name: '$_source.deleteAccount()',
      );
    } catch (e, s) {
      log(
        '❌ An unexpected error ocurred while Deleting user account',
        name: '$_source.deleteAccount()',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }
}
