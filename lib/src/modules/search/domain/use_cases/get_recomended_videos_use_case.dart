import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetRecommendedVideosUseCase {
  // This class is responsible for fetching new videos.
  // It will interact with the repository to get the data.
  // The implementation details will depend on the specific requirements of the application.

  // Constructor
  const GetRecommendedVideosUseCase({required ISearchRepository searchRepository})
    : _searchRepository = searchRepository;

  final ISearchRepository _searchRepository;

  /// Fetches new videos from the repository.
  ///
  /// This method will call the repository to get the new videos.
  /// It will return a [List<VideoModel>] with the new videos.
  /// **Parameters:**
  /// - `params` - A [FeedVideoParams] with the parameters to get the videos.
  /// **Returns:**
  /// - A [Future] of [List<VideoModel>] with the new videos.
  /// **Throws:**
  /// - [Exception] if an error occurs while fetching the videos.
  ///
  Future<List<Video>> execute({required FeedVideoParams params}) async {
    try {
      return await _searchRepository.getRecommendedVideos(params: params);
    } catch (e) {
      rethrow;
    }
  }
}
