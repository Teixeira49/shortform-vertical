part of 'splash_bloc.dart';

enum SplashStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == SplashStatus.initial;
  bool get isLoading => this == SplashStatus.loading;
  bool get isSuccess => this == SplashStatus.success;
  bool get isFailure => this == SplashStatus.failure;
}

/// {@template splash_state}
/// SplashState description
/// {@endtemplate}
class SplashState extends Equatable {
  /// {@macro splash_state}
  const SplashState({
    this.status = SplashStatus.initial,
    this.error = SplashErrors.none,
    this.isAlreadySignedIn = false,
  });

  /// Status of the state
  final SplashStatus status;

  /// Error of the state
  final SplashErrors error;

  final bool isAlreadySignedIn;

  @override
  List<Object> get props => [
        status,
        error,
        isAlreadySignedIn,
      ];

  /// Creates a copy of the current SplashState with property changes
  SplashState copyWith({
    SplashStatus? status,
    SplashErrors? error,
    bool? isAlreadySignedIn,
  }) {
    return SplashState(
      status: status ?? this.status,
      error: error ?? this.error,
      isAlreadySignedIn: isAlreadySignedIn ?? this.isAlreadySignedIn,
    );
  }
}
