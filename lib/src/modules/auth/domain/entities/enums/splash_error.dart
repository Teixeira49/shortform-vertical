/// Enum for Splash Errors, so that we can show different error messages
enum SplashErrors {
  noInternet,
  usingVPN,
  serverError,
  inMaintainance,
  updateRequired,
  unknownError,
  none;

  bool get isNoInternet => this == SplashErrors.noInternet;
  bool get isUsingVPN => this == SplashErrors.usingVPN;
  bool get isServerError => this == SplashErrors.serverError;
  bool get isInMaintainance => this == SplashErrors.inMaintainance;
  bool get isUpdateRequired => this == SplashErrors.updateRequired;
  bool get isUnknownError => this == SplashErrors.unknownError;
  bool get isNone => this == SplashErrors.none;
}
