import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../page/premium_page.dart';

part 'success_page_event.dart';
part 'success_page_state.dart';

class PremiumPageBloc extends Bloc<SuccessPageEvent, SuccessPageState> {
  PremiumPageBloc() : super(const SuccessPageState()) {
    on<SuccessPageContinueButtonPressed>(_onSuccessPageContinueButtonPressed);
  }

  FutureOr<void> _onSuccessPageContinueButtonPressed(
    SuccessPageContinueButtonPressed event,
    Emitter<SuccessPageState> emit,
  ) async {
  }
}
