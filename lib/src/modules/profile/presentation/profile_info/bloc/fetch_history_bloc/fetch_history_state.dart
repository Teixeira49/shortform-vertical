part of 'fetch_history_bloc.dart';

enum FetchHistoryStatus {
  initial,
  loading,
  loaded,
  loadedWithNoData,
  error;

  bool get isInitial => this == FetchHistoryStatus.initial;
  bool get isLoading => this == FetchHistoryStatus.loading;
  bool get isLoaded => this == FetchHistoryStatus.loaded;
  bool get isLoadedWithNoData => this == FetchHistoryStatus.loadedWithNoData;
  bool get isError => this == FetchHistoryStatus.error;
}

/// {@template update_feed_state}
/// FetchHistoryState description
/// {@endtemplate}
class FetchHistoryState extends Equatable {
  /// {@macro update_feed_state}
  const FetchHistoryState({
    this.status = FetchHistoryStatus.initial,
    this.feedVideos = const [],
    this.errorMessage,
  });

  /// Status of the state
  final FetchHistoryStatus status;

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

  /// Creates a copy of the current FetchHistoryState with property changes
  FetchHistoryState copyWith({
    FetchHistoryStatus? status,
    List<Video>? feedVideos,
    String? errorMessage,
  }) {
    return FetchHistoryState(
      status: status ?? this.status,
      feedVideos: feedVideos ?? this.feedVideos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}