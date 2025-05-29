part of 'notifications_page_bloc.dart';

abstract class SuccessPageEvent extends Equatable {
  const SuccessPageEvent();

  @override
  List<Object> get props => [];
}

class SuccessPageContinueButtonPressed extends SuccessPageEvent {}
