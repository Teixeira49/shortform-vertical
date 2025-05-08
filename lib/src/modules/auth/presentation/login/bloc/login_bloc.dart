import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../shared/core/exceptions/app_exception.dart';
import '../../../../../shared/features/inputs/inputs.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../domain/entities/entities.dart';
import '../../../domain/use_cases/sign_in_user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required SignInUserUseCase signInUserUseCase,
  })  : _signInUserUseCase = signInUserUseCase,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginShowPasswordButtonPressed>(_onLoginShowPasswordButtonPressed);
    on<LoginSubmitButtonPressed>(_onLoginSubmitButtonPressed);
  }

  final SignInUserUseCase _signInUserUseCase;

  FutureOr<void> _onLoginEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(emailInput: EmailInput.dirty(value: event.email)));
  }

  FutureOr<void> _onLoginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        passwordInput: PasswordInput.dirty(value: event.password),
      ),
    );
  }

  FutureOr<void> _onLoginShowPasswordButtonPressed(
    LoginShowPasswordButtonPressed event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  FutureOr<void> _onLoginSubmitButtonPressed(
    LoginSubmitButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));

      await _signInUserUseCase.execute(
        params: SignInUserParams(
          email: state.emailInput.value.trim(),
          password: state.passwordInput.value.trim(),
        ),
      );

      emit(
        state.copyWith(
          status: LoginStatus.success,
        ),
      );
    } on NeedToValidateEmailToLoginException catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          exception: e,
        ),
      );
    } on AppException catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
        ),
      );
    }
  }
}
