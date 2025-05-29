import '../entities/entities.dart';

abstract class ISearchRepository {
  /// Get a pagination of videos.
  ///
  /// **Parameters:**
  /// - [FeedVideoParams] with the parameters to get the videos.
  ///
  /// **Returns:**
  /// - A [Future] of [List<VideoModel>] with the videos.
  Future<List<Video>> getRecommendedVideos({required FeedVideoParams params});
}