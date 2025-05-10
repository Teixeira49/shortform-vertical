import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../page/success_page.dart';

part 'success_page_event.dart';
part 'success_page_state.dart';

class SuccessPageBloc extends Bloc<SuccessPageEvent, SuccessPageState> {
  SuccessPageBloc({
    required this.params,
  }) : super(const SuccessPageState()) {
    on<SuccessPageContinueButtonPressed>(_onSuccessPageContinueButtonPressed);
  }

  final SuccessPageParams params;

  FutureOr<void> _onSuccessPageContinueButtonPressed(
    SuccessPageContinueButtonPressed event,
    Emitter<SuccessPageState> emit,
  ) async {
    params.onPressed.call();
  }
}
