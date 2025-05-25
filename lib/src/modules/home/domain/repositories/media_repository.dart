import '../entities/entities.dart';

abstract class IMediaRepository {
  /// Get a pagination of videos.
  ///
  /// **Parameters:**
  /// - [FeedVideoParams] with the parameters to get the videos.
  ///
  /// **Returns:**
  /// - A [Future] of [List<VideoModel>] with the videos.
  Future<List<Video>> getVideos({required FeedVideoParams params});
}