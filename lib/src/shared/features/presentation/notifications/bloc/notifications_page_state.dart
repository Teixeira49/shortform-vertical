part of 'notifications_page_bloc.dart';

enum SuccessPageStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == SuccessPageStatus.initial;
  bool get isLoading => this == SuccessPageStatus.loading;
  bool get isSuccess => this == SuccessPageStatus.success;
  bool get isFailure => this == SuccessPageStatus.failure;
}

/// {@template login_state}
/// SuccessPageState description
/// {@endtemplate}
class SuccessPageState extends Equatable {
  /// {@macro login_state}
  const SuccessPageState();

  @override
  List<Object> get props => [];

  /// Creates a copy of the current SuccessPageState with property changes
  SuccessPageState copyWith() {
    return const SuccessPageState();
  }
}
