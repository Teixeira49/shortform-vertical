import '../../models/models.dart';

abstract class IProfileApi {
  /// Delete Account of the current user.
  ///
  /// **Parameters:**
  /// - `userId` - An instance of [DeleteAccountParamsModel] containing the user id.
  ///
  /// **Returns:**
  /// - A [Future] of [void].
  Future<void> deleteAccount({required DeleteAccountParamsModel params});

  /// Get a pagination of videos.
  ///
  /// **Parameters:**
  /// - `params` - A [FeedVideoParams] with the parameters to get the videos.
  ///
  /// **Returns:**
  /// - A [Future] of [List<VideoModel>] with the videos.
  Future<List<VideoModel>> getVideosHistory({required FeedVideoParamsModel params});
}
