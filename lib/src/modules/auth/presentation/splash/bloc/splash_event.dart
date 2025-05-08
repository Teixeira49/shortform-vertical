part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class SplashStarted extends SplashEvent {
  const SplashStarted();
}

class SplashRetry extends SplashEvent {
  const SplashRetry();
}

class SplashConnectionChanged extends SplashEvent {
  const SplashConnectionChanged();
}
