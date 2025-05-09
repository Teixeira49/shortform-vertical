part of 'get_current_user_bloc.dart';

enum GetCurrentUserStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == GetCurrentUserStatus.initial;
  bool get isLoading => this == GetCurrentUserStatus.loading;
  bool get isSuccess => this == GetCurrentUserStatus.success;
  bool get isFailure => this == GetCurrentUserStatus.failure;
}

/// {@template login_state}
/// GetCurrentUserState description
/// {@endtemplate}
class GetCurrentUserState extends Equatable {
  /// {@macro login_state}
  const GetCurrentUserState({
    this.status = GetCurrentUserStatus.initial,
    this.user = User.emptySkeletonizer,
    this.errorMessage,
    this.exception,
  });

  /// Status of the state
  final GetCurrentUserStatus status;

  /// Current user
  final User user;

  /// Error message
  final String? errorMessage;

  final Exception? exception;

  @override
  List<Object?> get props => [
        status,
        user,
        errorMessage,
        exception,
      ];

  /// Creates a copy of the current GetCurrentUserState with property changes
  GetCurrentUserState copyWith({
    GetCurrentUserStatus? status,
    User? user,
    String? errorMessage,
    Exception? exception,
  }) {
    return GetCurrentUserState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
    );
  }
}
