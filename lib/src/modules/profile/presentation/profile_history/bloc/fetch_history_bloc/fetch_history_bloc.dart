import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../domain/use_cases/get_videos_history_use_case.dart';


part 'fetch_history_event.dart';
part 'fetch_history_state.dart';

class FetchHistoryBloc extends Bloc<FetchHistoryEvent, FetchHistoryState> {
  FetchHistoryBloc({
    required GetVideosHistoryUseCase getVideosHistoryUseCase,
  })  : _getVideosHistoryUseCase = getVideosHistoryUseCase,
        super(FetchHistoryState()) {
    on<FetchFeedVideosEvent>(_onFetchHistoryEvent);
  }

  final GetVideosHistoryUseCase _getVideosHistoryUseCase;

  FutureOr<void> _onFetchHistoryEvent(
    FetchFeedVideosEvent event,
    Emitter<FetchHistoryState> emit,
  ) async {
    emit(state.copyWith(status: FetchHistoryStatus.loading));

    try {
      final videos = await _getVideosHistoryUseCase.execute(
        params: FeedVideoParams(
          userId: event.userId,
        ),
      );

      if (videos.isEmpty) {
        emit(state.copyWith(
          status: FetchHistoryStatus.loadedWithNoData,
          feedVideos: [],
        ));
      } else {
        emit(state.copyWith(
          status: FetchHistoryStatus.loaded,
          feedVideos: videos,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: FetchHistoryStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
