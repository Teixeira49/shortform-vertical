part of 'update_recommendations_bloc.dart';

enum UpdateFeedStatus {
  initial,
  loading,
  loaded,
  loadedWithNoData,
  error;

  bool get isInitial => this == UpdateFeedStatus.initial;
  bool get isLoading => this == UpdateFeedStatus.loading;
  bool get isLoaded => this == UpdateFeedStatus.loaded;
  bool get isLoadedWithNoData => this == UpdateFeedStatus.loadedWithNoData;
  bool get isError => this == UpdateFeedStatus.error;
}

/// {@template update_feed_state}
/// UpdateFeedState description
/// {@endtemplate}
class RecommendationStackState extends Equatable {
  /// {@macro update_feed_state}
  const RecommendationStackState({
    this.status = UpdateFeedStatus.initial,
    this.feedVideos = const [],
    this.errorMessage,
  });

  /// Status of the state
  final UpdateFeedStatus status;

  /// List of feed videos
  final List<Video> feedVideos;

  /// Error message
  final String? errorMessage;

  bool get isFormValid => feedVideos.isNotEmpty && !status.isLoading;

  @override
  List<Object?> get props => [
        status,
        feedVideos,
        errorMessage,
      ];

  /// Creates a copy of the current UpdateFeedState with property changes
  RecommendationStackState copyWith({
    UpdateFeedStatus? status,
    List<Video>? feedVideos,
    String? errorMessage,
  }) {
    return RecommendationStackState(
      status: status ?? this.status,
      feedVideos: feedVideos ?? this.feedVideos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}