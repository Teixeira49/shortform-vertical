import '../entities/entities.dart';

abstract class IProfileRepository {
  /// Delete the current user.
  ///
  /// **Parameters:**
  /// - `params` - An instance of [DeleteAccountParams] containing the user id.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> deleteAccount({required DeleteAccountParams params});

  /// Get a pagination of videos.
  ///
  /// **Parameters:**
  /// - [FeedVideoParams] with the parameters to get the videos.
  ///
  /// **Returns:**
  /// - A [Future] of [List<VideoModel>] with the videos.
  Future<List<Video>> getVideoHistory({required FeedVideoParams params});
}
