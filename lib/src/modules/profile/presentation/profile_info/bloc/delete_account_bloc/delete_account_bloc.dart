import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:venetiktok/src/modules/profile/domain/entities/params/delete_account_params.dart';

import '../../../../domain/use_cases/delete_account_use_case.dart';

part 'delete_account_event.dart';

part 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc({
    required DeleteUserUseCase deleteUserUseCase,
  })  : _deleteUserUseCase = deleteUserUseCase,
        super(const DeleteAccountState()) {
    on<DeleteAccountButtonPressed>(_onDeleteAccountButtonPressed);
  }

  final DeleteUserUseCase _deleteUserUseCase;

  FutureOr<void> _onDeleteAccountButtonPressed(
      DeleteAccountButtonPressed event,
      Emitter<DeleteAccountState> emit,
      ) async {
    try {
      emit(state.copyWith(status: DeleteAccountStatus.loading));

      final params = DeleteAccountParams(userId: event.userId);

      await _deleteUserUseCase.execute(params: params);

      emit(state.copyWith(status: DeleteAccountStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DeleteAccountStatus.failure));
    }
  }
}
