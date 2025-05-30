part of 'fetch_history_bloc.dart';

abstract class FetchHistoryEvent extends Equatable {
  const FetchHistoryEvent();

  @override
  List<Object> get props => [];
}

/// Event to fetch the feed videos
///
/// This event is triggered when the user wants to fetch the feed videos.
/// It can be used to refresh the feed or load more videos.
///
/// It can be used to fetch the feed videos when the user scrolls to the bottom of the feed.

class FetchFeedVideosEvent extends FetchHistoryEvent {
  /// {@macro fetch_feed_videos_event}
  const FetchFeedVideosEvent({
    this.page = 1,
    this.limit = 10,
    required this.userId,
  });

  /// Page number to fetch
  final int page;

  /// Limit of videos to fetch
  final int limit;

  final int userId;

  @override
  List<Object> get props => [page, limit, userId];
}