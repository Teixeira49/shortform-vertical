import 'dart:developer';

import '../../domain/entities/entities.dart';
import '../models/models.dart';

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

  @override
  Future<List<Video>> getVideoHistory({required FeedVideoParams params}) async {
    try {
      log('📡 Getting videos...', name: 'SearchRepositoryImpl.getVideos()');

      final response = await _profileApi.getVideosHistory(
        params: FeedVideoParamsModel.fromEntity(params),
      );

      if (response.isEmpty) {
        log('❌ No videos found', name: 'SearchRepositoryImpl.getVideos()');
        return [];
      } else {
        log(
          '✅ Videos found: ${response.length}',
          name: 'SearchRepositoryImpl.getVideos()',
        );
        return response.map((e) => e.toEntity()).toList();
      }
    } catch (e, s) {
      log(
        '❌ An unexpected error ocurred while getting videos',
        name: 'SearchRepositoryImpl.getVideos()',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }
}
