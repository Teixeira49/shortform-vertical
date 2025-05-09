import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../auth/domain/use_cases/sign_out_user.dart';

part 'sign_out_event.dart';

part 'sign_out_state.dart';

class SignOutBloc extends Bloc<SignOutEvent, SignOutState> {
  SignOutBloc({
    required SignOutUserUseCase signOutUserUseCase,
  })  : _signOutUserUseCase = signOutUserUseCase,
        super(const SignOutState()) {
    on<SignOutButtonPressed>(_onSignOutButtonPressed);
  }

  final SignOutUserUseCase _signOutUserUseCase;

  FutureOr<void> _onSignOutButtonPressed(
      SignOutButtonPressed event,
      Emitter<SignOutState> emit,
      ) async {
    try {
      emit(state.copyWith(status: SignOutStatus.loading));

      await _signOutUserUseCase.execute();

      emit(state.copyWith(status: SignOutStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SignOutStatus.failure));
    }
  }
}
