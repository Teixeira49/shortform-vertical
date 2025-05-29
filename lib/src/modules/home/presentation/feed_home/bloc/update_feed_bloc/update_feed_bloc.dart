import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/entities.dart';
import '../../../../domain/use_cases/get_new_videos_use_case.dart';

part 'update_feed_event.dart';

part 'update_feed_state.dart';

class UpdateFeedBloc extends Bloc<UpdateFeedEvent, UpdateFeedState> {
  UpdateFeedBloc({
    required GetNewVideosUseCase getNewVideosUseCase,
  })  : _getNewVideosUseCase = getNewVideosUseCase,
        super(UpdateFeedState()) {
    on<FetchFeedVideosEvent>(_onUpdateFeedEvent);
  }

  final GetNewVideosUseCase _getNewVideosUseCase;

  FutureOr<void> _onUpdateFeedEvent(
    FetchFeedVideosEvent event,
    Emitter<UpdateFeedState> emit,
  ) async {
    emit(state.copyWith(status: UpdateFeedStatus.loading));

    try {
      final videos = await _getNewVideosUseCase.execute(
        params: FeedVideoParams(
          userId: event.userId,
        ),
      );

      if (videos.isEmpty) {
        emit(state.copyWith(
          status: UpdateFeedStatus.loadedWithNoData,
          feedVideos: [],
        ));
      } else {
        emit(state.copyWith(
          status: UpdateFeedStatus.loaded,
          feedVideos: videos,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: UpdateFeedStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
