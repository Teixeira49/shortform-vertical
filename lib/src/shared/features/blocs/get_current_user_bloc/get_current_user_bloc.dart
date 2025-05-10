import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../entities/entities/entities.dart';
import '../../use_cases/get_current_user.dart';


part 'get_current_user_event.dart';
part 'get_current_user_state.dart';

class GetCurrentUserBloc
    extends Bloc<GetCurrentUserEvent, GetCurrentUserState> {
  GetCurrentUserBloc({
    required GetCurrentUserUseCase getCurrentUserUseCase,
  })  : _getCurrentUserUseCase = getCurrentUserUseCase,
        super(const GetCurrentUserState()) {
    on<GetCurrentUserStarted>(_onGetCurrentUserStarted);
    on<GetCurrentUserRetryButtonPressed>(_onGetCurrentUserRetryButtonPressed);

    add(GetCurrentUserStarted());
  }

  final GetCurrentUserUseCase _getCurrentUserUseCase;

  FutureOr<void> _onGetCurrentUserStarted(
      GetCurrentUserStarted event, Emitter<GetCurrentUserState> emit,) async {
    try {
      emit(state.copyWith(status: GetCurrentUserStatus.loading));

      final user = await _getCurrentUserUseCase.execute();

      emit(state.copyWith(
        status: GetCurrentUserStatus.success,
        user: user,
      ),);
    } catch (e) {
      emit(state.copyWith(status: GetCurrentUserStatus.failure));
    }
  }

  FutureOr<void> _onGetCurrentUserRetryButtonPressed(
      GetCurrentUserRetryButtonPressed event,
      Emitter<GetCurrentUserState> emit,) {
    emit(const GetCurrentUserState());
    add(GetCurrentUserStarted());
  }
}
