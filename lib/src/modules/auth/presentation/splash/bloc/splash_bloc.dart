import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/use_cases/get_current_token.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    required GetCurrentTokenUsecase getCurrentTokenUseCase,
    // required RemoteSettingsUseCases remoteSettings, //TODO: Add remoteSettings with remote config
  })  : _getCurrentTokenUseCase = getCurrentTokenUseCase,
        super(const SplashState()) {
    on<SplashStarted>(_onSplashStarted);
    on<SplashRetry>(_onSplashRetry);
    on<SplashConnectionChanged>(_onConnectionChanged);

    add(const SplashStarted());
  }

  final GetCurrentTokenUsecase _getCurrentTokenUseCase;
  // final RemoteSettingsUseCases _remoteSettings;

  FutureOr<void> _onSplashStarted(
    SplashStarted event,
    Emitter<SplashState> emit,
  ) async {
    try {
      emit(state.copyWith(status: SplashStatus.loading));

      //TODO: Remove this delay
      //await Future.delayed(const Duration(milliseconds: 1500));

      final connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult.first == ConnectivityResult.none) {
        log('❌ No internet connection');
        emit(
          state.copyWith(
            status: SplashStatus.failure,
            error: SplashErrors.noInternet,
          ),
        );
        return;
      }

      if (connectivityResult.first == ConnectivityResult.vpn) {
        log('❌ Using VPN');
        emit(
          state.copyWith(
            status: SplashStatus.failure,
            error: SplashErrors.usingVPN,
          ),
        );
        return;
      }

      //TODO:
      // final settings = await _remoteSettings.fetchRemoteSettings();

      // if (settings.isInMaintenance) {
      //   log('❌ App is in maintenance');
      //   emit(
      //     state.copyWith(
      //       status: SplashStatus.failure,
      //       error: SplashErrors.inMaintainance,
      //     ),
      //   );
      //   return;
      // }

      // FIXME: No dependency injection for PackageInfo. Improve this in the future.
      // final packageInfo = await PackageInfo.fromPlatform();
      // final buildNumber = int.tryParse(packageInfo.buildNumber) ?? 0;
      // if (buildNumber < settings.minimumAppVersion) {
      //   log('App needs update. Current version: $buildNumber, minimum version: ${settings.minimumAppVersion}');
      //   emit(
      //     state.copyWith(
      //       status: SplashStatus.failure,
      //       error: SplashErrors.updateRequired,
      //     ),
      //   );
      //   return;
      // }
      final token = await _getCurrentTokenUseCase.execute();

      emit(
        state.copyWith(
          status: SplashStatus.success,
          isAlreadySignedIn: token?.isNotEmpty,
        ),
      );
    } catch (e, s) {
      log('❌ Unknown error on SplashBloc', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: SplashStatus.failure,
          error: SplashErrors.unknownError,
        ),
      );
    }
  }

  FutureOr<void> _onSplashRetry(SplashRetry event, Emitter<SplashState> emit) {
    emit(const SplashState());
    add(const SplashStarted());
  }

  FutureOr<void> _onConnectionChanged(
    SplashConnectionChanged event,
    Emitter<SplashState> emit,
  ) {
    // Only automatically retry if the previous error was no internet connection
    if (state.status.isFailure && state.error == SplashErrors.noInternet) {
      emit(const SplashState());
      add(const SplashStarted());
    }
  }
}
