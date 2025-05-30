// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get mediaAppTitle => 'FD Media App';

  @override
  String get welcomeToAppLabel => 'Welcome to FD Media';

  @override
  String get loginEnterYourUserInfoText => 'Enter your user information';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHintText => 'Enter your email';

  @override
  String get emailErrorText => 'The email is not valid';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHintText => 'Enter your password';

  @override
  String get passwordErrorText => 'The password is not valid';

  @override
  String get loginButtonLabel => 'Login';

  @override
  String get forgotPasswordLabel => 'Forgot password?';

  @override
  String get dontHaveAnAccountLabel => 'Don\'t have an account?';

  @override
  String get signUpLabel => 'Sign up';

  @override
  String get signUpButtonLabel => 'Sign up';

  @override
  String get signUpCreateYourAccountText => 'Create your account';

  @override
  String get signUpEnterYourPersonalInfoText => 'Enter your personal information';

  @override
  String get nameLabel => 'Name';

  @override
  String get nameHintText => 'Enter your name';

  @override
  String get nameErrorText => 'The name is not valid';

  @override
  String get lastNameLabel => 'Last name';

  @override
  String get lastNameHintText => 'Enter your last name';

  @override
  String get lastNameErrorText => 'The last name is not valid';

  @override
  String get signUpAlreadyHaveAnAccountLabel => 'Already have an account?';

  @override
  String get signInLabel => 'Sign in';

  @override
  String get dniLabel => 'Identiy card (V)';

  @override
  String get dniHintText => 'Enter your identity card';

  @override
  String get dniErrorText => 'The identity card is not valid';

  @override
  String get kudoErrorText => 'Oops! Something went wrong!';

  @override
  String get cancelButtonLabel => 'Cancel';

  @override
  String get confirmButtonLabel => 'Confirm';

  @override
  String get continueButtonLabel => 'Continue';

  @override
  String get acceptButtonLabel => 'Accept';

  @override
  String get sendButtonLabel => 'Send';

  @override
  String get goBackButtonLabel => 'Go back';

  @override
  String get viewCommerceButtonLabel => "See gift card";

  @override
  String get signUpSuccessText => 'Enter to your email to validate your account, to start accumulating stamps and redeem rewards at your favorite stores.';

  @override
  String get signUpCompletedLabel => 'Sign up completed!';

  @override
  String get pleaseTryAgainLabel => 'Please try again';

  @override
  String get recoverPasswordText => 'Enter your email to recover your password';

  @override
  String get recoverPasswordLabel => 'Recover password';

  @override
  String get recoverPasswordEnterCodeText => 'Enter the code sent to your email';

  @override
  String get forgotPasswordEmailSendSuccessLabel => 'Email sent successfully!';

  @override
  String get forgotPasswordEmailSendSuccessText => 'Enter the recovery link we have sent you';

  @override
  String get waitLabel => 'Wait';

  @override
  String get waitLabelWithExpression => 'Wait!';

  @override
  String get loginNeedToValidateEmailText => 'You must confirm your account by email before logging in.';

  @override
  String get homeLabel => 'Home';

  @override
  String get profileLabel => 'Profile';

  @override
  String get searchLabel => 'Search';

  @override
  String get historyLabel => 'Recently viewed';

  @override
  String get likedLabel => 'Favorites';

  @override
  String get bookmarksLabel => 'Your list';

  @override
  String welcomeWithNameLabel(Object name) {
    return 'Welcome, $name';
  }

  @override
  String get seeMoreLabel => 'See More';

  @override
  String get appStandardErrorMessage => 'An error occurred';

  @override
  String get appRetryButtonLabel=> 'Retry';

  @override
  String get appConnectionErrorTitle => 'Connection error';

  @override
  String get appConnectionErrorNoInternetDescription => 'Please check your internet connection and try again.';

  @override
  String get aooConnectionErrorVpnDetectedTitle => 'VPN detected';

  @override
  String get appConnectionErrorActiveVPNDescription => 'Please disable your VPN connection and try again.';

  @override
  String get appMaintenanceModeTitle => 'The app is under maintenance';

  @override
  String get appMaintenanceModeDescription => 'We are working to improve the app. Please, come back later.';

  @override
  String get appUpdateRequiredTitle => 'Update required';

  @override
  String get appUpdateRequiredDescription => 'You must update to the latest version to continue.';

  @override
  String get appServerErrorMessage => 'An error occurred while processing your request. Please try again.';

  @override
  String get appUnknownErrorMessage => 'An unexpected error occurred. Please try again.';

  @override
  String get appStillHavingProblemsButton => 'Still having problems?';

  @override
  String get appContactSupportButton => 'Contact support';

  @override
  String get appUpdateAppButton => 'Update app';

  @override
  String get appErrorOpeningUpdateUrlTitle => 'Could not open store';

  @override
  String get appErrorOpeningUpdateUrlDescription => 'Please update the app manually.';

  @override
  String get forgotPasswordNotEmailLabel => 'The email entered is not registered in FD Media';

  @override
  String get profilePersonalInfoLabel => 'Personal information';

  @override
  String get profileTermsAndConditionsLabel => 'Terms and conditions';

  @override
  String get profileDeleteAccountLabel => 'Delete account';

  @override
  String get profileDeleteAccountWarningLabel => 'Are you sure you want to delete your account?';

  @override
  String get profileDeleteAccountDescriptionLabel => 'Your account will be permanently deleted and you will not be able to recover it.';

  @override
  String get profileDeleteAccountSuccessLabel => 'Your account has been successfully deleted.';

  @override
  String get profileLogoutLabel => 'Logout';

  @override
  String get areYouSureLabel => 'Are you sure?';

  @override
  String get logoutConfirmationText => 'If you log out, you will have to log in again';

  @override
  String get exceptionNoCurrentUserFoundLabel => 'No user found on this device';

  @override
  String get profileFullNameLabel => 'Full name';

  @override
  String get openLabel => 'Open';

  @override
  String get closeLabel => 'Close';

  @override
  String get informationLabel => 'Information';

  @override
  String get rewardsLabel => 'Rewards';

  @override
  String get nextRewardsLabel => 'Next rewards';

  @override
  String get contactLabel => 'Contact';

  @override
  String get openingHoursLabel => 'Opening hours';

  @override
  String get locationLabel => 'Location';

  @override
  String phoneNumberWithNumberLabel(Object phone) {
    return 'Phone number: $phone';
  }

  @override
  String get privacyPolicyLabel => 'Privacy policy';

  @override

  @override
  String get filtersLabel => 'Filters';

  @override
  String get filtersRestoreButtonLabel => 'Restore';

  @override
  String get filtersApplyButtonLabel => 'Apply';

  @override
  String get availableRewardsLabel => 'Available rewards';

  @override
  String get redeemedRewardsLabel => 'Redeemed rewards';

  @override
  String get obtainLabel => 'Obtain';

  @override
  String get aboutUsButton => "About us";

  @override
  String get aboutYouButton => "About my account";

  @override
  String get browseByLabel => "Browse by";

  @override
  String get categoryLabel => "Category";


  @override
  String get deleteAccountButton => "Delete account";


  @override
  String get editProfileButton => "Edit profile";


  @override
  String get forYouLabel => "Recommended for you";

  @override
  String get genreLabel => "Genres";


  @override
  String get getPremiumButton => "Get Premium";

  @override
  String get helpButton => "Help";

  @override
  String get kidsLabels => "Kids";

  @override
  String get logoutButton => "Logout";

  @override
  String get mediaOriginalsLabel => "Media Originals";

  @override
  String get menuLabel => "Options";

  @override
  String get moviesLabel => "Movies";

  @override
  String get settingsButton => "Settings";

  @override
  String get shortsLabel => "Shorts";

  @override
  String get termsAndConditionsButton => "Terms and conditions";

  @override
  String get viewAllLabel => "View all";

  @override
  String get searchByLabel => "Search by actor, title, genre, etc.";

  @override
  String get resultsLabel => "Results";

  @override
  String get premiumMessageLabel => "";

  @override
  String get snackBarSaved => "Video saved successfully";

  @override
  String get snackBarWarningDemo => "Not available in demo version";

  @override
  String get premiumAvailablePlans => "Available plans";

  @override
  String get premiumButtonLabel => "Get {plan} plan";

  @override
  String get premiumLabel => "Premium";

  @override
  String get premiumRateMonthLabel => "at Month";

  @override
  String get premiumRateYearLabel => "at year";

  @override
  String get premiumReason1 => "Watch videos without ads";

  @override
  String get premiumReason2 => "Better playback quality";

  @override
  String get premiumReason3 => "Access to exclusive content";

  @override
  String get premiumWhyLabel => "Why I need Media Premium?";

  @override
  String get notificationsHaveNotNotificationsLabel => "You don't have notifications";

  @override
  String get notificationsLabel => "Notifications";

  @override
  String get reportFeedbackLabel => "Please describe why the video content is not suitable for the platform.";

  @override
  String get reportLabel => "Report Content";

  @override
  String get reportVideoTitle => "Video title: {element}";

}
