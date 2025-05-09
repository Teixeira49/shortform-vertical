part of 'delete_account_bloc.dart';

enum DeleteAccountStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == DeleteAccountStatus.initial;
  bool get isLoading => this == DeleteAccountStatus.loading;
  bool get isSuccess => this == DeleteAccountStatus.success;
  bool get isFailure => this == DeleteAccountStatus.failure;
}

/// {@template login_state}
/// SignOutState description
/// {@endtemplate}
class DeleteAccountState extends Equatable {
  /// {@macro login_state}
  const DeleteAccountState({
    this.status = DeleteAccountStatus.initial,
    this.errorMessage,
    this.exception,
  });

  /// Status of the state
  final DeleteAccountStatus status;

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
  DeleteAccountState copyWith({
    DeleteAccountStatus? status,
    String? errorMessage,
    Exception? exception,
  }) {
    return DeleteAccountState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
    );
  }
}
