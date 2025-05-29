import '../../models/models.dart';

abstract class ISearchApi {
  /// Get a pagination of videos.
  ///
  /// **Parameters:**
  /// - `params` - A [FeedVideoParams] with the parameters to get the videos.
  ///
  /// **Returns:**
  /// - A [Future] of [List<VideoModel>] with the videos.
  Future<List<VideoModel>> getRecommendedVideos({required FeedVideoParamsModel params});
}