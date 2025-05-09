import '../../models/models.dart';

abstract class IMediaApi {
  /// Get a pagination of videos.
  ///
  /// **Parameters:**
  /// - `params` - A [FeedVideoParams] with the parameters to get the videos.
  ///
  /// **Returns:**
  /// - A [Future] of [List<VideoModel>] with the videos.
  Future<List<VideoModel>> getVideos({required FeedVideoParamsModel params});
}