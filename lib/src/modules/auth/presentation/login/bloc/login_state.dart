part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == LoginStatus.initial;
  bool get isLoading => this == LoginStatus.loading;
  bool get isSuccess => this == LoginStatus.success;
  bool get isFailure => this == LoginStatus.failure;
}

/// {@template login_state}
/// LoginState description
/// {@endtemplate}
class LoginState extends Equatable {
  /// {@macro login_state}
  const LoginState({
    this.status = LoginStatus.initial,
    this.emailInput = const EmailInput.pure(),
    this.passwordInput = const PasswordInput.pure(),
    this.showPassword = false,
    this.errorMessage,
    this.exception,
  });

  /// Status of the state
  final LoginStatus status;

  /// Email input
  final EmailInput emailInput;

  /// Password input
  final PasswordInput passwordInput;

  /// Show password
  final bool showPassword;

  /// Error message
  final String? errorMessage;

  final Exception? exception;

  bool get isFormValid =>
      emailInput.isValid && passwordInput.value.isNotEmpty && !status.isLoading;

  @override
  List<Object?> get props => [
        status,
        emailInput,
        passwordInput,
        showPassword,
        errorMessage,
        exception,
      ];

  /// Creates a copy of the current LoginState with property changes
  LoginState copyWith({
    LoginStatus? status,
    EmailInput? emailInput,
    PasswordInput? passwordInput,
    bool? showPassword,
    String? errorMessage,
    Exception? exception,
  }) {
    return LoginState(
      status: status ?? this.status,
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      showPassword: showPassword ?? this.showPassword,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
    );
  }
}
