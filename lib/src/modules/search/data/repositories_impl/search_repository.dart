import 'dart:developer';

import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../data_source/remote/search_api.dart';
import '../models/models.dart';

class SearchRepository implements ISearchRepository {
  SearchRepository({required ISearchApi searchApi}) : _searchApi = searchApi;

  final ISearchApi _searchApi;

  @override
  Future<List<Video>> getRecommendedVideos({required FeedVideoParams params}) async {
    try {
      log('📡 Getting videos...', name: 'SearchRepositoryImpl.getVideos()');

      final response = await _searchApi.getRecommendedVideos(
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
