import '../../data/models/entities_model/entities.dart';
import '../entities/entities.dart';

abstract class IMediaRepository {
  /// Get a pagination of videos.
  ///
  /// **Parameters:**
  /// - [FeedVideoParams] with the parameters to get the videos.
  ///
  /// **Returns:**
  /// - A [Future] of [List<VideoModel>] with the videos.
  Future<List<VideoModel>> getVideos({required FeedVideoParams params});
}