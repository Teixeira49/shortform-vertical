import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../page/notifications_page.dart';

part 'notifications_page_event.dart';
part 'notifications_page_state.dart';

class NotificationsPageBloc extends Bloc<SuccessPageEvent, SuccessPageState> {
  NotificationsPageBloc() : super(const SuccessPageState()) {
    on<SuccessPageContinueButtonPressed>(_onSuccessPageContinueButtonPressed);
  }


  FutureOr<void> _onSuccessPageContinueButtonPressed(
    SuccessPageContinueButtonPressed event,
    Emitter<SuccessPageState> emit,
  ) async {
  }
}
