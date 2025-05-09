import 'dart:developer';

import 'package:venetiktok/src/modules/home/data/models/entities_model/video_model.dart';
import 'package:venetiktok/src/modules/home/data/models/models.dart';
import 'package:venetiktok/src/modules/home/domain/entities/params/feed_video_params.dart';
import 'package:venetiktok/src/modules/home/domain/repositories/media_repository.dart';

import '../data_source/remote/media_api.dart';

class MediaRepositoryImpl extends IMediaRepository {
  MediaRepositoryImpl({required IMediaApi mediaApi}) : _mediaApi = mediaApi;

  final IMediaApi _mediaApi;

  @override
  Future<List<VideoModel>> getVideos({required FeedVideoParams params}) async {
    try {
      log('📡 Getting videos...', name: 'MediaRepositoryImpl.getVideos()');

      final response = await _mediaApi.getVideos(
        params: FeedVideoParamsModel.fromEntity(params),
      );

      if (response.isEmpty) {
        log('❌ No videos found', name: 'MediaRepositoryImpl.getVideos()');
        return [];
      } else {
        log(
          '✅ Videos found: ${response.length}',
          name: 'MediaRepositoryImpl.getVideos()',
        );
        return response;
      }
    } catch (e, s) {
      log(
        '❌ An unexpected error ocurred while getting videos',
        name: 'MediaRepositoryImpl.getVideos()',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }
}
