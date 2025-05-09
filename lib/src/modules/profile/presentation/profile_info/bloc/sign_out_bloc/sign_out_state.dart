part of 'sign_out_bloc.dart';

enum SignOutStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == SignOutStatus.initial;
  bool get isLoading => this == SignOutStatus.loading;
  bool get isSuccess => this == SignOutStatus.success;
  bool get isFailure => this == SignOutStatus.failure;
}

/// {@template login_state}
/// SignOutState description
/// {@endtemplate}
class SignOutState extends Equatable {
  /// {@macro login_state}
  const SignOutState({
    this.status = SignOutStatus.initial,
    this.errorMessage,
    this.exception,
  });

  /// Status of the state
  final SignOutStatus status;

  /// Error message
  final String? errorMessage;

  final Exception? exception;

  @override
  List<Object?> get props => [
    status,
    errorMessage,
    exception,
  ];

  /// Creates a copy of the current SignOutState with property changes
  SignOutState copyWith({
    SignOutStatus? status,
    String? errorMessage,
    Exception? exception,
  }) {
    return SignOutState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
    );
  }
}
