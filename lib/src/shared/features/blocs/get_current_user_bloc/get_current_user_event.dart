part of 'get_current_user_bloc.dart';

abstract class GetCurrentUserEvent extends Equatable {
  const GetCurrentUserEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentUserStarted extends GetCurrentUserEvent {}

class GetCurrentUserRetryButtonPressed extends GetCurrentUserEvent {}
